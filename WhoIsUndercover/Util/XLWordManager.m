//
//  XLWordManager.m
//  WhoIsUndercover
//
//  Created by God、long on 14-6-20.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLWordManager.h"




@interface XLWordManager ()


//返回数据库中文件的存储路径
- (NSString *)_sqliteFilePath;

//打开数据库的方法
- (sqlite3 *)_openDatabase;

//关闭数据库的方法
- (void)_closeDatabase;




@end

@implementation XLWordManager






//通过sqlite3指针来访问打开的数据库
sqlite3 *_database = nil;


+(id)sharedInstance
{
    static XLWordManager *_manager = nil;
    if (_manager == nil) {
        _manager = [[XLWordManager alloc]init];
    }
    return _manager;
}



#pragma mark - private methods -


- (NSString *)_sqliteFilePath
{
    NSArray *_tempArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //拼接文件名称
    NSString *_filePath = [_tempArray.firstObject stringByAppendingPathComponent:@"wordsInfo.sqlite"];
   // NSLog(@"%@",_filePath);
    return _filePath;
}


- (sqlite3 *)_openDatabase
{
 
    
    //得到数据库文件的具体路径
    NSString *sqliteFilePath = [self _sqliteFilePath];
    
    
    
    //通过执行打开数据库的函数返回具体的访问地址
    const char *cString = [sqliteFilePath UTF8String];
    sqlite3_open(cString, &_database);
    //NSFileManager文件管理类
    NSFileManager *_fileManager = [NSFileManager defaultManager];
    BOOL result = [_fileManager fileExistsAtPath:sqliteFilePath];
    
    //如果文件存在，在文件中创建一个表
    if (result) {
        NSString *_sqlString = [NSString stringWithFormat:@"create table if not exists %@ (word_civilian text primary key,word_undercover text)",self.type];
       
        sqlite3_exec(_database, [_sqlString UTF8String] , NULL, NULL, NULL);
    }
    return _database;
}

- (void)_closeDatabase
{
    if (_database != nil) {
        //sqlite中关闭数据库函数
        sqlite3_close(_database);
    }
    
}

//插入学生信息的方法
- (BOOL)insertWordsItem:(XLWords *)words
{
    //1.打开数据库
    sqlite3 *database = [self _openDatabase];
    //2.数据库的数据集指针（功能性指针）,插入数据时,用来传递信息的，把需要插入的信息赋给它，它把信息带给数据库
    sqlite3_stmt *_statement = nil;
    //3.准备插入数据库的SQL语句,?号是提前占位。相当于形参的概念。需要后来通过函数来绑定参数
    NSString *_insertSQL = [NSString stringWithFormat:@"insert into %@ (word_civilian,word_undercover) values (?,?)",self.type];
  //   NSLog(@"................charubiao  2 %@",_insertSQL);
    //4.准备SQL语句，并检测sql语句的正确性，如果正确，就写入到_statement 指针中，如果错误，则返回错误信息
    int result = sqlite3_prepare_v2(database, [_insertSQL UTF8String], -1, &_statement, NULL);
    if (result == SQLITE_OK) {
        //绑定数据
        //在绑定数据的相关函数中，参数列表中的第一个参数，是sqlite3_stmt类型的数据集指针，第二个参数是需要绑定的数据的编号（第几个问号），打三个参数才是需要绑定的数据，如果有第四个三叔设置为-1（表示任意字节长度），第五个参数设置为NULL（不需要回调函数）。
//        sqlite3_bind_int(_statement,1,words.number);
        sqlite3_bind_text(_statement,1,[words.wordOfCivilian UTF8String],-1,NULL);
        sqlite3_bind_text(_statement,2,[words.wordOfUndercover UTF8String],-1,NULL);
//        //把image对象转成nsdata对象
//        NSData *_imageData = UIImagePNGRepresentation(student.image);
//        //_imageData bytes是把nsdata对象转成字节
//        sqlite3_bind_blob(_statement, 4, [_imageData bytes], [_imageData length], NULL);
    }
    //sqlite3_step函数是让数据集指针执行自己保存的sql语句的函数
    if (sqlite3_step(_statement) == SQLITE_DONE) {
        //表示操作完成
        //释放statement指针所占用的资源（内存）
        sqlite3_finalize(_statement);
        //关闭数据库
        [self _closeDatabase];
        return YES;
    }
    //释放statement指针所占用的资源（内存）
    sqlite3_finalize(_statement);
    //关闭数据库
    [self _closeDatabase];
    return NO;
}

//更新学生信息的方法
- (BOOL)updateWordsInfo:(XLWords *)words withNumber:(NSInteger)number
{
    //1.打开数据库
    sqlite3 *database = [self _openDatabase];
    //2.准备更新的sql语句
    NSString *_updateSql = [NSString stringWithFormat:@"update %@ set word_civilian = ?,word_undercover = ? where word_num = ?",self.type];
    //3.声明数据集指针
    sqlite3_stmt *_statement = nil;
    int result = sqlite3_prepare_v2(database, [_updateSql UTF8String], -1, &_statement, NULL);
    //如果sql语句准备无误，绑定数据
    if (result == SQLITE_OK) {
        sqlite3_bind_text(_statement, 1, [words.wordOfCivilian UTF8String], -1, NULL);
        sqlite3_bind_text(_statement, 2, [words.wordOfUndercover UTF8String], -1, NULL);
//        NSData *_imageData = UIImagePNGRepresentation(student.image);
//        sqlite3_bind_blob(_statement, 3, [_imageData bytes], -1, NULL);
        sqlite3_bind_int(_statement, 3, (int)number);
        //表示操作完成
        sqlite3_finalize(_statement);
        [self _closeDatabase];
        return YES;
    }
    sqlite3_finalize(_statement);
    [self _closeDatabase];
    return NO;
}

- (BOOL)deleteWordsInfoWithNumber:(NSString *)wordcivilian
{
    //1.打开数据库
    sqlite3 *database = [self _openDatabase];
    //2.准备更新的sql语句
    NSString *deleteSql = [NSString stringWithFormat:@"delete from %@ where word_civilian= ?",self.type];
    //3.声明数据集指针
    sqlite3_stmt *_statement = nil;
    BOOL result = sqlite3_prepare_v2(database, [deleteSql UTF8String], -1, &_statement, NULL);
    if (result == SQLITE_OK) {
//        sqlite3_bind_int(_statement, 1, wordcivilian);
        sqlite3_bind_text(_statement,1,[wordcivilian UTF8String],-1,NULL);
    }
    if (sqlite3_step(_statement) == SQLITE_DONE) {
        sqlite3_finalize(_statement);
        [self _closeDatabase];
        return YES;
    }
    sqlite3_finalize(_statement);
    [self _closeDatabase];
    return NO;
    
}

//查找制定词的方法实现
- (XLWords *)WordsInfoWithNumber:(NSString *)wordcivilian
{
    //1.打开数据库
    sqlite3 *database = [self _openDatabase];
    //2.查找指定学生信息的sql
    NSString *selectSql = [NSString stringWithFormat:@"select *from %@ where word_civilian = ?",self.type];
    //3.声明数据集
    sqlite3_stmt *_statement = nil;
    int result = sqlite3_prepare_v2(database, [selectSql UTF8String], -1, &_statement, NULL);
    if (result == SQLITE_OK) {
        //绑定学生参数
        sqlite3_bind_text(_statement,1,[wordcivilian UTF8String],-1,NULL);
    }
    if (sqlite3_step(_statement) == SQLITE_ROW) {
        //取出查找到得对应记录的每一个字段的值
        NSString *wordOfCivilian = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_statement, 1)];
       
        NSString *wordOfUndercover = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_statement, 2)];
//        //先得到二进制字节流，转换成nsdata类型的对象
//        const void *data = sqlite3_column_blob(_statement, 3);
//        //同时还可以获得第四列的二进制字节流的长度
//        NSUInteger length = sqlite3_column_bytes(_statement, 3);
//        NSData *_imageData = [NSData dataWithBytes:data length:length];
//        UIImage *_image = [UIImage imageWithData:_imageData];
        
        sqlite3_finalize(_statement);
        [self _closeDatabase];
        
        //封装成Student类型的对象
        XLWords *_words = [XLWords wordWithWordOfCivilian:wordOfCivilian wordOfUndercover:wordOfUndercover];
        return _words;
    }
    sqlite3_finalize(_statement);
    [self _closeDatabase];
    return nil;
}

//查找所有的表中的对象
- (NSMutableArray *)wordsList
{
    //1.打开数据库
    sqlite3 *database = [self _openDatabase];
    NSString *searchSql = [NSString stringWithFormat:@"select * from %@",self.type];
    sqlite3_stmt *_statement = nil;
    int result = sqlite3_prepare_v2(database, [searchSql UTF8String], -1, &_statement, NULL);
    if (result == SQLITE_OK) {
        //用来存储对象的数组
        NSMutableArray *array = [NSMutableArray array];
        
        while (sqlite3_step(_statement) == SQLITE_ROW) {
            NSString *wordOfCivilian = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_statement, 0)];
            NSString *wordOfUndercover = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(_statement, 1)];
//            NSData *data = [NSData dataWithBytes:sqlite3_column_blob(_statement, 3) length:sqlite3_column_bytes(_statement, 3)];
//            UIImage *image = [UIImage imageWithData:data];
            XLWords *_words = [XLWords wordWithWordOfCivilian:wordOfCivilian wordOfUndercover:wordOfUndercover];
            //把得到的对象加入数组中
            [array addObject:_words];
        }
        sqlite3_finalize(_statement);
        [self _closeDatabase];
        return array;
    }
    sqlite3_finalize(_statement);
    [self _closeDatabase];
    return nil;
}


- (void)dealloc
{
    [_type release];
    [super dealloc];
}



@end
