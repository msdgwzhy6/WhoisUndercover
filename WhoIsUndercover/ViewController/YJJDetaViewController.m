//
//  YJJDetaViewController.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-21.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJDetaViewController.h"
#import "YJJWordGroupManager.h"
#import "UIView+GetBackgroundImage.h"
#import "UIImage+BlurImage.h"
#import "YJJAddView.h"
#import "YJJWordGroupTableViewCell.h"



@interface YJJDetaViewController ()

@property (nonatomic , assign) NSInteger tempTag;
@property (nonatomic , assign) NSInteger tempIndex;

@property (nonatomic,retain)NSMutableArray *getGainArray;

@property (nonatomic,retain)NSMutableArray *getAddArray;

@end

@implementation YJJDetaViewController


int temp = 1 ;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.getGainArray = [[[NSMutableArray alloc]initWithArray:self.gainArray]autorelease];
    
    self.count = @"0";
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"帮助1.png"];
    [self.view addSubview:imageView];
    [imageView release];
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 75, 290, 430)];
    imageView1.image = [UIImage imageNamed:@"边框"];
    [imageView addSubview:imageView1];
    [imageView1 release];
    
    
    //用于存放双击后的数据的数组
   // self.gainArray = [[NSMutableArray alloc]init];
    //用于存储添加的值得数组
   // self.addArray = [[NSMutableArray alloc]init];
    
   
    
    
    
    
    //词条列表
    
    self.view.backgroundColor = [UIColor yellowColor];
    UISegmentedControl *_segmentedC = [[UISegmentedControl alloc]initWithItems:@[@"默认",@"我的收藏",@"我的贡献"]];
    _segmentedC.frame = CGRectMake(30, 35, 260, 40);
    _segmentedC.selectedSegmentIndex = 0;
    _segmentedC.tag = 160;
  //  _segmentedC.backgroundColor = [UIColor yellowColor];
    [self handleSegmentSelectAction:_segmentedC];
    [_segmentedC addTarget:self action:@selector(handleSegmentSelectAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedC];
    [_segmentedC release];
    
    
    
    
    
    //返回上一级按钮
    UIButton *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(30, 510, 42, 52);
    [returnButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [returnButton setImage:[UIImage imageNamed:@"返回2.png"] forState:UIControlStateHighlighted];

    [returnButton addTarget:self action:@selector(handleReturnButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnButton];
   
    
    //添加新词条的按钮
   
        UIButton *addPunishWordsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addPunishWordsButton.frame = CGRectMake(250, 510, 42, 48);
        [addPunishWordsButton setImage:[UIImage imageNamed:@"加号2"] forState:UIControlStateNormal];
        [addPunishWordsButton setImage:[UIImage imageNamed:@"加号1"] forState:UIControlStateHighlighted];
        [addPunishWordsButton addTarget:self action:@selector(handleNextPunishButtonAction:) forControlEvents:UIControlEventTouchUpInside];


    [self.view addSubview:addPunishWordsButton];

    
}

#pragma mark 将文件写入路径
//重写addArray的get方法，读取本地文件中的数组

- (NSMutableArray *)addArray{
    //完整存储
    NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
   // NSLog(@"沙盒路径文件 = %@" , _paths);
   //存储路径
    NSString *doucumentPath = [_paths lastObject];
    NSString *arrayPath = [doucumentPath  stringByAppendingPathComponent:@"addArray.plist"];
//判断文件是否存在
      if (_addArray == nil) {
        //使用文件管理类NSFileManager来判定指定的文件路径下的文件是否存在
        NSFileManager *_fileManager = [NSFileManager defaultManager];
        BOOL result = [_fileManager fileExistsAtPath:arrayPath];
        //如果存在则解档文件返回可变数组对象，否则创建数组对象
        if (result) {
            _addArray = [[NSMutableArray arrayWithContentsOfFile:arrayPath] retain];
        } else {
            _addArray = [[NSMutableArray alloc] init];
        }
    }
    return _addArray;
    
    
}

//重写gainArray的get方法，读取文件中的数组
- (NSMutableArray *)gainArray{
    //完整存储
    NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
   // NSLog(@"沙盒路径文件 = %@" , _paths);
    //存储路径
    NSString *doucumentPath = [_paths lastObject];
    NSString *arrayPath = [doucumentPath  stringByAppendingPathComponent:@"gainArray.plist"];
    //判断文件是否存在
    if (_gainArray == nil) {
        //使用文件管理类NSFileManager来判定指定的文件路径下的文件是否存在
        NSFileManager *_fileManager = [NSFileManager defaultManager];
        BOOL result = [_fileManager fileExistsAtPath:arrayPath];
        //如果存在则解档文件返回可变数组对象，否则创建数组对象
        if (result) {
            _gainArray = [[NSMutableArray arrayWithContentsOfFile:arrayPath] retain];
        } else {
            _gainArray = [[NSMutableArray alloc] init];
        }
    }
    return _gainArray;
    
    
    
}







#pragma mark -- 各种方法的实现
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//实现列表的转换
- (void)handleSegmentSelectAction:(UISegmentedControl *)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:{
            UITableView *tableView = (UITableView *) [self.view viewWithTag:_tempTag] ;
            [tableView removeFromSuperview];
            
            self.tempTag = 163;
            
            self.tempIndex = 0;
            
            //默认表视图

            //单元格的创建
            self.defaultTableView = [[[UITableView alloc]initWithFrame:CGRectMake(30, 85, 260, 400) style:UITableViewStylePlain]autorelease];
            self.defaultTableView.rowHeight = 50;
            self.defaultTableView.tag = 163;
            self.defaultTableView.separatorColor = [UIColor clearColor];
            self.defaultTableView.backgroundColor = [UIColor clearColor];
            [self.view addSubview:self.defaultTableView];
            self.defaultTableView.dataSource = self;
            self.defaultTableView.delegate = self;
           //接收数据源数组
            self.dataArray = [YJJWordGroupManager genderateActWordGroup];
            
            //注册单元格
            
        [self.defaultTableView registerClass:[YJJWordGroupTableViewCell class] forCellReuseIdentifier:grouptableCell];
            

            
        }
            
            break;
           
            
        case 1:{
            
            //删掉前一个出现的view
          UITableView *tableView = (UITableView *) [self.view viewWithTag:_tempTag] ;
            [tableView removeFromSuperview];
            
            self.tempTag = 161;
            self.tempIndex = 1;
            
            //收藏视图
            
            //单元格的创建
            self.collectTableView = [[[UITableView alloc]initWithFrame:CGRectMake(30, 85, 260, 400) style:UITableViewStylePlain]autorelease];
            _collectTableView.tag = 161;
            self.collectTableView.rowHeight = 50;
            self.collectTableView.separatorColor = [UIColor clearColor];
            self.collectTableView.backgroundColor = [UIColor clearColor ];
            self.collectTableView.dataSource = self;
            self.collectTableView.delegate = self;
            [self.view addSubview:self.collectTableView];
           
          
            
            
        }
            break;
        case 2:{
            
            UITableView *tableView = (UITableView *) [self.view viewWithTag:_tempTag] ;
            [tableView removeFromSuperview];
            self.tempTag = 162;
            self.tempIndex = 2;
            
           //贡献视图

            //单元格的创建
            self.contributionTableView = [[[UITableView alloc]initWithFrame:CGRectMake(30, 85, 260, 400) style:UITableViewStylePlain]autorelease];
            _contributionTableView.tag = 162;
            self.contributionTableView.rowHeight = 50;
            self.contributionTableView.separatorColor = [UIColor clearColor];
            self.contributionTableView.backgroundColor = [UIColor clearColor];
            self.contributionTableView.dataSource = self;
            self.contributionTableView.delegate = self;
            [self.view addSubview:self.contributionTableView];
            
           
            
            
            
            
        }
            break;
        default:
            break;
    }
    
    
}

//点击返回按钮，返回上一级
- (void)handleReturnButtonAction:(UIButton *)sender{
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *filePath = [paths.firstObject stringByAppendingPathComponent:@"gainArray.plist"];
    [self.getGainArray writeToFile:filePath atomically:YES];
    
        [self dismissViewControllerAnimated:YES completion:nil];
    self.count = @"1";

    
}

//实现添加新词条的按钮
-(void)handleNextPunishButtonAction:(UIButton *)sender{
    
        UIView *view = [[UIView alloc]initWithFrame:self.view.bounds];
        view.backgroundColor = [UIColor clearColor];
        view.userInteractionEnabled = YES;
    
         view.alpha = 0;
        view.tag = 169;
        [self.view addSubview:view];
    
    //添加模糊背景
    
    UIImage *shotImage = [self.view screenShot];
    
    UIImage *blurImage = [shotImage re_applyBlurWithRadius:5 tintColor:[UIColor clearColor] saturationDeltaFactor:1 maskImage:nil];
    UIImageView *backImageView = [[UIImageView alloc]initWithImage:blurImage];
    backImageView.frame = self.view.bounds;
    [view addSubview:backImageView];
    [backImageView release];
    
    
    
        //弹出框添加新词条的view
        YJJAddView *addView =[[YJJAddView alloc]initWithFrame:self.view.bounds];
        addView.userInteractionEnabled = YES;
        addView.tag = 180;
        [addView.removeButton addTarget:self action:@selector(handleRemoveButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //提交按钮
        [addView.referButton addTarget:self action:@selector(handleReferButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:addView];
        [addView release];
        [view release];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 1;
    }];
    
}


//响应移除按钮
- (void)handleRemoveButtonAction:(UIButton *)sender{
    
    UIView *view = [self.view viewWithTag:169];
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
       [view removeFromSuperview];
    });

    
    
    
}



//响应提交按钮，将数据存储到本地
- (void)handleReferButtonAction:(UIButton *)sender{
    
    YJJAddView *addView = (YJJAddView *) [self.view viewWithTag:180];
  //设置提醒框
    UILabel *presentLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 50, 200, 30)];
    presentLabel.textAlignment = NSTextAlignmentCenter;
    presentLabel.textColor = [UIColor whiteColor];
    presentLabel.backgroundColor = [UIColor blackColor];
    presentLabel.font = [UIFont boldSystemFontOfSize:14];
    presentLabel.alpha =1;
    [self.view addSubview:presentLabel];
    [presentLabel release];
    [UIView animateWithDuration:2 animations:^{
        presentLabel.alpha = 1;
        [UIView animateWithDuration:1 animations:^{
            presentLabel.alpha = 0;
        }];
        
    }];

    
    if ([addView.textField.text isEqualToString:@""]){
              presentLabel.text = @"叮咚，请不要交白卷！";
        
    }
    else{
       BOOL result = NO;
        for (NSString *string  in self.addArray) {
            if ( [addView.textField.text isEqualToString: string]  ) {
               result = YES;
              }
        }
        if (result == YES) {
        presentLabel.text = @"词条太火，已有伙伴上传！";
            
        }
     else    {
            [self.addArray  addObject:addView.textField.text];
         
         
         [self.getGainArray addObject:addView.textField.text];
         
         
            NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *filePath = [_paths.firstObject stringByAppendingPathComponent:@"addArray.plist"];
            [self.addArray writeToFile:filePath atomically:YES];
            [self.contributionTableView reloadData];
         
         
         
         
         
         
         
         
         UIView *view = [self.view viewWithTag:169];
         [UIView animateWithDuration:0.5 animations:^{
             view.alpha = 0;
      
         }];
         
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             
             [view removeFromSuperview];
         });
         

         
         
         
            presentLabel.text = @"已添加到我的贡献";
         
        }
    }
 
}


//指定单元格数量
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_tempIndex == 0) {
        return self.dataArray.count;
    }
    if (_tempIndex == 1) {
        return self.getGainArray.count;//
    }
    if (_tempIndex == 2) {
        return self.addArray.count;
    }
    return 0;
   
    
}

//单元格的创建
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//为单元格添加对应的数据
    
    tableView.allowsSelection = NO;

  if (_tempIndex == 0) {

//        static NSString *cellDeentifier = @"cell";
        YJJWordGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:grouptableCell forIndexPath:indexPath];
//        if (cell == nil) {
//            cell = [[[YJJWordGroupTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDeentifier]autorelease];
//        }
//        //重用，当划出视图后，就清除
//        for (id object in cell.subviews) {
//            if ([object isKindOfClass:[YJJWordGroupTableViewCell class]]) {
//                [object removeFromSuperview];
//            }
//        }
        if (indexPath.row %2 == 0) {
            UIImageView *cellBackground = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbackground"]] autorelease];
            cell.backgroundView = cellBackground;
        }else{
            
            UIImageView *cellBackground = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbackground1"]] autorelease];
            cell.backgroundView = cellBackground;
            
        }
      NSString *tempString = [self.dataArray objectAtIndex:indexPath.row];
      cell.stringLabel.text = tempString;
        cell.numberLabel.text = [NSString stringWithFormat:@"%ld" , indexPath.row + 1];
      
      BOOL isNull = YES;
      //判断是否已经加入收藏，如果加入收藏，就把心变为实心。
      for (NSString *object in self.getGainArray) {
          if ([tempString isEqualToString:object]) {
              isNull = NO;
          }
      }
      
      if (isNull) {
          [cell.heartButton setTitle:@"开" forState:UIControlStateNormal];
          [cell.heartButton setImage:[UIImage imageNamed:@"空心"] forState:UIControlStateNormal];
          

      } else {
          
          [cell.heartButton setTitle:@"关" forState:UIControlStateNormal];
          [cell.heartButton setImage:[UIImage imageNamed:@"实心"] forState:UIControlStateNormal];

        }
      
      
      
            [cell.heartButton addTarget:self action:@selector(handleHeartButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else if (_tempIndex == 1){
        static NSString *cellDeentifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDeentifier];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDeentifier]autorelease];
        }
        
        //重用，当划出视图后，就清除
        for (id object in cell.subviews) {
            if ([object isKindOfClass:[UITableViewCell class]]) {
                
                [object removeFromSuperview];
            }
        }
        if (indexPath.row %2 == 0) {
            UIImageView *cellBackground = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbackground"]] autorelease];
            cell.backgroundView = cellBackground;
        }else{
            
            UIImageView *cellBackground = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbackground1"]] autorelease];
            cell.backgroundView = cellBackground;
            
        }
        
        
        cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.text = [self.getGainArray objectAtIndex:indexPath.row];//
        cell.textLabel.numberOfLines = 0;

        return cell;
        
    }else if (_tempIndex == 2){
        static NSString *cellDeentifier = @"ccc";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDeentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDeentifier]autorelease];
        }
        
        //重用，当划出视图后，就清除
        for (id object in cell.subviews) {
            if ([object isKindOfClass:[UITableViewCell class]]) {
                [object removeFromSuperview];
            }
        }
        if (indexPath.row %2 == 0) {
            UIImageView *cellBackground = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbackground"]] autorelease];
            cell.backgroundView = cellBackground;
        }else{
            
            UIImageView *cellBackground = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbackground1"]] autorelease];
            cell.backgroundView = cellBackground;
            
        }
        cell.textLabel.text = [self.addArray objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.adjustsFontSizeToFitWidth = YES;
        cell.textLabel.numberOfLines = 0;

     
        return cell;
        
    }
      return nil;
}

//允许对单元格进行操作
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_tempIndex == 1 || _tempIndex == 2) {
        return YES;
    }else
        return NO;
    
}

//实现点赞按钮
- (void)handleHeartButtonAction:(UIButton *)sender{
    
    
    YJJWordGroupTableViewCell *cell = (YJJWordGroupTableViewCell *)  sender.superview.superview;
    
    NSString *inforString = @"";

  
//如果title是开的，就表示此词条还没有加入收藏，反之，就表示已经加入了收藏

    if ([sender.titleLabel.text isEqualToString:@"关"]) {
        
        [sender setImage:[UIImage imageNamed:@"空心"] forState:UIControlStateNormal];

        [sender setTitle:@"开" forState:UIControlStateNormal];
        
        [self.getGainArray removeObject:cell.stringLabel.text];
        inforString = @"您已取消收藏！";
        
        
    }
    if   ([sender.titleLabel.text isEqualToString:@"开"]){
        
        [sender setTitle:@"关" forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"实心"] forState:UIControlStateNormal];
        
        BOOL result = NO;
        for (NSString *string  in self.getGainArray) {
            if ( [cell.stringLabel.text isEqualToString: string]  ) {
                result = YES;
            }
        }
        if (result == YES) {
           
            
            
        }
        else    {
            [self.getGainArray addObject:cell.stringLabel.text];
            inforString = @"恭喜你，收藏成功！";
        }
        
        
        
        
    }
    
    UILabel *alterText = [[UILabel alloc]initWithFrame:CGRectMake(60, 50 , 200, 30)];
    alterText.text = inforString;
    alterText.font = [UIFont systemFontOfSize:14];
    alterText.backgroundColor = [UIColor blackColor];
    alterText.textColor = [UIColor whiteColor];
    alterText.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:alterText];
    [alterText release];
    //渐隐
    [UIView animateWithDuration:2 animations:^{
        alterText.alpha = 0;
    }];
    //移除
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alterText removeFromSuperview];
        
    });
    

    
}




//删除单元格及单元格的数据

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (_tempIndex == 1) {
            
            [self.getGainArray removeObjectAtIndex:indexPath.row];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
             // [self.collectTableView reloadData];
            
            
        }
        
        if (_tempIndex == 2) {
            NSString *currentString = [self.addArray objectAtIndex:indexPath.row];
            
            [self.addArray removeObject:currentString];
            NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *filePath = [_paths.firstObject stringByAppendingPathComponent:@"addArray.plist"];

            [self.addArray writeToFile:filePath atomically:YES];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.contributionTableView reloadData];
            
        }
    }
    
}













- (void)dealloc{
    
    
    [_defaultTableView release];
    [_collectTableView release];
    [_contributionTableView release];
    [_dataArray release];
    [_gainArray release];
    [_addArray release];
    [_getAddArray release];
    [_getAddArray release];
    [super dealloc];
}


@end
