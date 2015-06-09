//
//  XLWordManager.h
//  WhoIsUndercover
//
//  Created by God、long on 14-6-20.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLWords.h"
#import <sqlite3.h>





@interface XLWordManager : NSObject






@property (nonatomic,retain)NSString *type;//类型






//声明一个单例方法
+ (id)sharedInstance;

//声明一个添加词语信息的方法
- (BOOL)insertWordsItem:(XLWords *)words;

//声明一个更新词语信息的方法
- (BOOL)updateWordsInfo:(XLWords *)words
               withNumber:(NSInteger)number;

//删除一条指定的记录
- (BOOL)deleteWordsInfoWithNumber:(NSString *)wordcivilian;

//查找指定词语信息的方法
- (XLWords *)WordsInfoWithNumber:(NSString *)wordcivilian;

//查找所有词语的信息
- (NSMutableArray *)wordsList;



@end
