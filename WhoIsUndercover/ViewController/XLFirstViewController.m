//
//  XLFirstViewController.m
//  WhoIsUndercover
//
//  Created by God、long on 14-6-24.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLFirstViewController.h"
#import "XLBeginViewController.h"
#import "XLSlide.h"
#import "XLWordManager.h"
#import "TLLTView.h"
#import "XLAllWordOfType.h"
#import "ViewControllerFirst.h"
#import "XLAddMyWordViewController.h"
#import "MusicManager.h"
#import "AboutUsViewController.h"


@interface XLFirstViewController ()

//私有属性

@property (nonatomic,assign)NSInteger numberOfCivilian;//平民数量

@property (nonatomic,assign)NSInteger numberOfUndercover;//卧底数量

@property (nonatomic,assign)NSInteger numberOfGamePersons;//游戏总人数

@property (nonatomic,assign)NSInteger numberOfWhiteBoard;//白板数量

@property (nonatomic,retain)NSString *tableName;//表的名字

@property (nonatomic,retain)UIButton *tempButton;//临时传值Button


@end

@implementation XLFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //把自带的navigationBar隐藏
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   

    self.view.backgroundColor = [UIColor redColor];
    
    //设置游戏的背景图片
    
    NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"bg__1" ofType:@".png"];
    UIImage *_image = [[UIImage alloc] initWithContentsOfFile:_imagePath];
    self.backImageView = [[[UIImageView alloc]initWithImage:_image]autorelease];
    _backImageView.userInteractionEnabled = YES;
    
    self.backImageView.frame = CGRectMake(0, 0, 320, 568);
    
    [self.view addSubview:_backImageView];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_5.png"]];
  //  [_backImageView release];
    [_image release];
    


    
    
    
       //隐藏电池条的方法
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
 
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }

    //设置上方的自定义navigationBar的滚动视图
    
    XLSlide *_slideVC = [[XLSlide alloc]initWithFrame:CGRectMake(0, 20, 320, 80)];
    //   _slideVC.backgroundColor = [UIColor whiteColor];
    
    //给_slideVC上的Button添加响应方法
    
    [_slideVC.button1 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_slideVC.button2 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_slideVC.button3 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_slideVC.button4 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置默认选中的Button
    [_slideVC.button4 setImage:[UIImage imageNamed:@"slided_3.png"] forState:UIControlStateNormal];
    self.tempButton = _slideVC.button4;
   
    
    [_slideVC.button5 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_slideVC.button6 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_slideVC.button7 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [_slideVC.button8 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_slideVC];
    [_slideVC release];
    

    //添加 游戏人数设置的背景
    
    NSString *_imagePathOfBrand = [[NSBundle mainBundle]pathForResource:@"brand_bg" ofType:@".png"];
    UIImage *_imageOfBrand = [[UIImage alloc]initWithContentsOfFile:_imagePathOfBrand];
    self.setImageView = [[[UIImageView alloc]initWithImage:_imageOfBrand]autorelease];
    self.setImageView.userInteractionEnabled = YES;
    _setImageView.frame = CGRectMake(10, 200, 300, 150);
    [self.view addSubview:_setImageView];
    [_imageOfBrand release];
   // [_setImageView release];
    
    //设置玩家人数
    
    self.totailPlayerLabel = [[[UILabel alloc]initWithFrame:CGRectMake(60, 10, 90, 40)] autorelease];
    self.totailPlayerLabel.text = @"玩家人数:";
    self.totailPlayerLabel.font = [UIFont systemFontOfSize:15];
    self.totailPlayerLabel.textAlignment =NSTextAlignmentRight;
    self.totailPlayerLabel.textColor = [UIColor whiteColor];
    [self.setImageView addSubview:self.totailPlayerLabel];
    //设置玩家人数的显示的Label
    self.numberOfGamePersonLabel = [[[UILabel alloc]initWithFrame:CGRectMake(160, 15, 40, 30)]autorelease];
    self.numberOfGamePersonLabel.font = [UIFont systemFontOfSize:18];
    self.numberOfGamePersonLabel.text = @"3";//游戏总人数的显示
    [self.setImageView addSubview:self.numberOfGamePersonLabel];
    
    //设置人数滑块
    
    self.totailSlider = [[[UISlider alloc]initWithFrame:CGRectMake(65, 250, 190, 40)]autorelease];
    self.totailSlider.minimumValue = 3;
    self.totailSlider.value = 3;
    self.totailSlider.maximumValue = 16;

    [self.totailSlider setThumbImage:[UIImage imageNamed:@"slide__3.png"] forState:UIControlStateNormal];
    [self.totailSlider addTarget:self action:@selector(handleSliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.totailSlider];
  //  [self.totailSlider release];

    //设置“- 、+” Button
    
    //设置减号Button
    UIButton *reduceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    reduceButton.frame = CGRectMake(25, 250, 40, 40);
    [reduceButton setTitle:@"-" forState:UIControlStateNormal];
    [reduceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [reduceButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [reduceButton addTarget:self action:@selector(reduceButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reduceButton];
    //设置加号Button
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(255, 250, 40, 40);
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    

    //设置平民
    
    self.commonPeople = [[[TLLTView alloc]initWithFrame:CGRectMake(15, 105, 0, 0)]autorelease];
    self.commonPeople.titleLabel.text = @"平民:";
    self.commonPeople.numberLabel.text = @"2";
    [self.setImageView addSubview:self.commonPeople];
   // [self.commonPeople release];
    
    //设置卧底
    
    self.underConver = [[[TLLTView alloc]initWithFrame:CGRectMake(105, 105, 0, 0)]autorelease];
    self.underConver.titleLabel.text = @"卧底:";
    self.underConver.numberLabel.text = @"1";
    [self.setImageView addSubview:self.underConver];
 //   [self.underConver release];
    
    //设置白板
    
    self.white = [[[UILabel alloc]initWithFrame:CGRectMake(180, 100, 40, 40)] autorelease];
    self.white.font = [UIFont systemFontOfSize:15];
    self.white.textAlignment = NSTextAlignmentCenter;
    self.white.text = @"白板";
    [self.setImageView addSubview:self.white];
    
    //设置白板的按钮
    
    self.whiteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.whiteButton setTitle:@"开" forState:UIControlStateNormal];
    self.whiteButton.frame = CGRectMake(230, 305, 45, 30);
     [self.whiteButton setImage:[UIImage imageNamed:@"switch_blank_off.png"] forState:UIControlStateNormal];
    [self.whiteButton addTarget:self action:@selector(whiteSwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.whiteButton];
    
    [self whiteSwitchAction:self.whiteButton];

    //开始游戏Button
    
    self.playGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playGameButton.frame = CGRectMake(85, 370, 150, 100);
    [self.playGameButton setImage:[UIImage imageNamed:@"playGame1.png"] forState:UIControlStateNormal];
    [self.playGameButton setImage:[UIImage imageNamed:@"playGame_down.png"] forState:UIControlStateHighlighted];
    [self.playGameButton addTarget:self action:@selector(playGameButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playGameButton];
    
    //音乐按钮
    
    self.backgroundMusic =[UIButton buttonWithType:UIButtonTypeCustom ] ;
    self.backgroundMusic.frame = CGRectMake(15, 513, 60, 35);
    
    [self.backgroundMusic setImage:[UIImage imageNamed:@"rulebutton__2.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.backgroundMusic];
[self.backgroundMusic addTarget:self action:@selector(backgroundMusicAction:) forControlEvents:UIControlEventTouchUpInside];
    /*
    //创建音乐文件路径
    
    NSString *musicFilePath = [[NSBundle mainBundle]pathForResource:@"欢沁" ofType:@"mp3"];
    NSURL *musicURL = [[[NSURL alloc]initFileURLWithPath:musicFilePath] autorelease];
    NSError *error;
    self.myBackMusic = [[[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:&error]autorelease];
    
    MusicManager *_musicManager = [MusicManager shariInstance];
    _musicManager.backMusic = self.myBackMusic;
    
    if (error) {
        NSLog(@"error = %@",[error localizedDescription]);
    }
    [self.myBackMusic prepareToPlay];
    
    //设置音量大小
    [self.myBackMusic setVolume:1];
    
    //音乐循环次数，-1为一直循环
    self.myBackMusic.numberOfLoops = -1;
    //    //设置开关的初始为开，并且播放音乐
    //    self.backgroundMusic.on = YES;
    [self.myBackMusic play];
    
    
    */
    //帮助按钮
    self.helpButton =[UIButton buttonWithType:UIButtonTypeCustom];
    self.helpButton.frame = CGRectMake(245, 513, 60, 35);
    //    self.helpButton.backgroundColor = [UIColor greenColor];
    [self.helpButton setImage:[UIImage imageNamed:@"button__1.png"] forState:UIControlStateNormal];
    [self.helpButton addTarget:self action:@selector(helpButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.helpButton];
    
    //管理我的词库的按钮
    UIButton *_manageMyWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _manageMyWordButton.frame = CGRectMake(220, 120, 80, 40);
   // [_manageMyWordButton setTitle:@"管理词库" forState:UIControlStateNormal];
    [_manageMyWordButton setImage:[UIImage imageNamed:@"manageword_1.png"] forState:UIControlStateNormal];
   // _manageMyWordButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_manageMyWordButton addTarget:self action:@selector(handleManageMyWordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_manageMyWordButton];
    
    //随机词语按钮
    UIButton *_randomWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _randomWordButton.frame = CGRectMake(20, 120, 80, 40);
    [_randomWordButton setImage:[UIImage imageNamed:@"random_1.png"] forState:UIControlStateNormal];
    //_randomWordButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //[_randomWordButton setTitle:@"随机词语" forState:UIControlStateNormal];
    [_randomWordButton addTarget:self action:@selector(handleRandomWordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_randomWordButton];
    
    
    
    
    
    
    
    
    
    
    
    //游戏的开机画面
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    UIImage *image = [UIImage imageNamed:@"Default-567h@2x.png"];
    imageView.image = image;
    [self.view addSubview:imageView];
    [UIView animateWithDuration:1.5 animations:^{
        imageView.alpha = 0;
    }completion:^(BOOL finished){
        
    }];
    
    XLWordManager *_manager = [XLWordManager sharedInstance];
    
    _manager.type = tableNameOfMyWord;
    if (![_manager WordsInfoWithNumber:0]) {
        
        [XLAllWordOfType creatTableNameOfwordOfMyWord];
    }

    self.tableName = tableNameOfFriend;

}

//随机词语按钮的实现
- (void)handleRandomWordButtonAction:(UIButton *)sender
{
   
    NSInteger randomNumber = arc4random()%6+1;
    switch (randomNumber) {
        case 1:
            self.tableName = tableNameOfWorldCup;
            break;
        case 2:
            self.tableName = tableNameOfSchoolyard;
            break;
        case 3:
            self.tableName = tableNameOfFriend;
            break;
        case 4:
            self.tableName = tableNameOfFamily;
            break;
        case 5:
            self.tableName = tableNameOfEntertainment;
            break;
        case 6:
            self.tableName = tableNameOfPartysu;
            break;

        default:
            break;
    }
    
    UILabel *alterText = [[UILabel alloc]initWithFrame:CGRectMake(60, 370 , 200, 30)];
    alterText.text = @"词语以随机，请开始游戏！";
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

//管理我的词库按钮的实现
- (void)handleManageMyWordButtonAction:(UIButton *)sender
{
    XLAddMyWordViewController *addMyWordVC = [[XLAddMyWordViewController alloc]init];
    addMyWordVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:addMyWordVC animated:YES completion:^{
        
    }];
    
}


//减号按钮的实现

- (void)reduceButtonAction:(UIButton *)sender{
    self.totailSlider.value = (NSInteger)self.totailSlider.value - 1;
    //如果已经到了最小人数，再点这个减小按钮就没用了
    if ([self.numberOfGamePersonLabel.text  isEqual: @"3"] ) {
        
    }else{
        //如果没有达到最小人数，那么点击按钮，总人数减小1
        self.numberOfGamePersonLabel.text = [NSString stringWithFormat:@"%ld",[self.numberOfGamePersonLabel.text integerValue]-1];
        
        switch ((NSInteger)self.totailSlider.value) {
            case 9:
                self.underConver.numberLabel.text = [NSString stringWithFormat:@"%ld",[self.underConver.numberLabel.text integerValue]-1];
                break;
                
            default:
                self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",[self.commonPeople.numberLabel.text integerValue]-1];
                break;
        }
    }
}

//加号按钮的实现

- (void)addButtonAction:(UIButton *)sender{
    self.totailSlider.value = (NSInteger)self.totailSlider.value + 1;
    //如果已经到了最大人数，再点这个增大按钮就没用了
    if ([self.numberOfGamePersonLabel.text  isEqual: @"16"] ) {
        
    }else{
        //如果没有达到最小人数，那么点击按钮，总人数减小1
        self.numberOfGamePersonLabel.text = [NSString stringWithFormat:@"%ld",[self.numberOfGamePersonLabel.text integerValue]+1];
        
        
        switch ((NSInteger)self.totailSlider.value) {
            case 10:
                self.underConver.numberLabel.text = [NSString stringWithFormat:@"%ld",[self.underConver.numberLabel.text integerValue]+1];
                break;
                
            default:
                self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",[self.commonPeople.numberLabel.text integerValue]+1];
                break;
        }
    }
    
}




//开始游戏按钮的实现
- (void)playGameButtonAction:(UIButton *)sender{
    
    self.numberOfGamePersons = self.totailSlider.value;
    self.numberOfCivilian = [self.commonPeople.numberLabel.text integerValue];
    self.numberOfUndercover = [self.underConver.numberLabel.text integerValue];
    
    
    NSMutableArray *_wordArray = [NSMutableArray array];
    if ([self.tableName isEqualToString:tableNameOfMyWord]) {
        
        XLWordManager *_manager = [XLWordManager sharedInstance];
        _manager.type = self.tableName;
         _wordArray = [_manager wordsList];
        
    } else{
    
      _wordArray =[XLAllWordOfType getAppointTypeArray:self.tableName];
        
    }
    //随机出一个词语
    NSInteger _randomNumber = arc4random()%_wordArray.count ;
    
    XLWords *resultWord = [_wordArray objectAtIndex:_randomNumber];
    
    
    XLBeginViewController *_beginViewVC = [[XLBeginViewController alloc]init];
    //     传值
    _beginViewVC.numberGamePersons = self.numberOfGamePersons;
    _beginViewVC.numberAllOfGamePerson = self.numberOfGamePersons;
    _beginViewVC.numberOfCivilian = self.numberOfCivilian;
    _beginViewVC.numberOfUndercover = self.numberOfUndercover;
    _beginViewVC.numberOfWhiteBoard = self.numberOfWhiteBoard;
    _beginViewVC.wordOfCivilian = resultWord.wordOfCivilian;
    _beginViewVC.wordOfUndercover = resultWord.wordOfUndercover;
    //_beginViewVC.modalPresentationStyle = UIModalPresentationCustom;
    
    
    // _beginViewVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:_beginViewVC animated:YES];
    //   [self presentViewController:_beginViewVC animated:YES completion:^{
    
    //    }];
    
    [_beginViewVC release];
    
    
    
    
    
}

#pragma mark - return button action -
- (void)backgroundMusicAction:(UIButton *)sender{
    
  /*
    //当开关开始的时候music是开始的
    if ([sender.titleLabel.text isEqualToString:@"关"]) {
        [sender setImage:[UIImage imageNamed:@"music_on.png"] forState:UIControlStateNormal];
        [self.myBackMusic play];
        [sender setTitle:@"开" forState:UIControlStateNormal];
        
    }else  if ([sender.titleLabel.text isEqualToString:@"开"]){
        //当开关是关闭的时候music是暂停的
        [self.myBackMusic pause];
        [sender setImage:[UIImage imageNamed:@"music_off.png"] forState:UIControlStateNormal];
        [sender setTitle:@"关" forState:UIControlStateNormal];
        //        [myBackMusic stop];
        
    }
    */
    
    AboutUsViewController *_aboutusVC = [[AboutUsViewController alloc]init];
    [self presentViewController:_aboutusVC animated:YES completion:^{
        
    }];
    
    
    
}

#pragma mark - help button action -
//帮助按钮的实现
- (void)helpButtonAction:(UIButton *)sender{
    
    ViewControllerFirst *helpFirstVC = [[ViewControllerFirst alloc]init];
    [self.navigationController pushViewController:helpFirstVC animated:YES];
    [helpFirstVC release];
    
}


 //白板按钮的实现
- (void)whiteSwitchAction:(UIButton *)sender{
    
    if ( [sender.titleLabel.text isEqualToString:@"关"]) {
        
        [sender setImage:[UIImage imageNamed:@"switch_blank_on.png"] forState:UIControlStateNormal];
        self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",[self.commonPeople.numberLabel.text integerValue]-1];//将字符串的数字变成整形
        self.numberOfWhiteBoard = 1;
        [sender setTitle:@"开" forState:UIControlStateNormal];
        
    }else if([sender.titleLabel.text isEqualToString:@"开"]){
        
        [sender setImage:[UIImage imageNamed:@"switch_blank_off.png"] forState:UIControlStateNormal];
        self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",[self.commonPeople.numberLabel.text integerValue]+1];
        self.numberOfWhiteBoard = 0;
        [sender setTitle:@"关" forState:UIControlStateNormal];
    }
}

//滑动条的实现

- (void)handleSliderAction:(UISlider *)sender{
    
    self.numberOfGamePersonLabel.text = [NSString stringWithFormat:@"%ld",(NSInteger)sender.value];
    
    if([self.whiteButton.titleLabel.text isEqualToString:@"关"]){
        
        if ((NSInteger)sender.value >= 3 && (NSInteger)sender.value <= 9) {
            
            self.underConver.numberLabel.text = @"1";
            self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",(NSInteger)sender.value-1];
            
        } else if((NSInteger)sender.value >= 10 && (NSInteger)sender.value <= 16){
            
            self.underConver.numberLabel.text = @"2";
            self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",(NSInteger)sender.value-2];
            
        }
           }
    if([self.whiteButton.titleLabel.text isEqualToString:@"开"]){
        
        if ((NSInteger)sender.value >= 3 && (NSInteger)sender.value <= 9) {
            
            self.underConver.numberLabel.text = @"1";
            self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",(NSInteger)sender.value-2];
            
        } else if((NSInteger)sender.value >= 10 && (NSInteger)sender.value <= 11){
            
            self.underConver.numberLabel.text = @"2";
            self.commonPeople.numberLabel.text = [NSString stringWithFormat:@"%ld",(NSInteger)sender.value-3];
            
        }
    }
    
}


// 把电池条设为隐藏

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}



//给滑动视图的Button添加的方法实现

- (void)handleButtonAction:(UIButton *)sender
{
    
    //移动红色背景Button
    [self.tempButton setImage:[UIImage imageNamed:@"slide.png"] forState:UIControlStateNormal];
    [sender setImage:[UIImage imageNamed:@"slided_3.png"] forState:UIControlStateNormal];
    self.tempButton = sender;
    
    // @"世界杯",@"娱乐圈",@"重口味",@"朋友",@"校园",@"家庭",@"小章猜",@"词库"
    
    if ([sender.titleLabel.text isEqualToString:@"世界杯"]) {
        
        self.tableName = tableNameOfWorldCup;
        
    } else if ([sender.titleLabel.text isEqualToString:@"娱乐圈"]) {
        
        self.tableName = tableNameOfEntertainment;
        
//    } else if ([sender.titleLabel.text isEqualToString:@"重口味"]) {
//        
//        self.tableName = tableNameOfHardcore;
        
    } else if ([sender.titleLabel.text isEqualToString:@"朋友"]) {
        
        self.tableName = tableNameOfFriend;
        
    } else if ([sender.titleLabel.text isEqualToString:@"校园"]) {
        
        self.tableName = tableNameOfSchoolyard;
        
    } else if ([sender.titleLabel.text isEqualToString:@"家庭"]) {
        
        self.tableName = tableNameOfFamily;
        
    } else if ([sender.titleLabel.text isEqualToString:@"小清新"]) {
        
        self.tableName = tableNameOfPartysu;
        
    } else if ([sender.titleLabel.text isEqualToString:@"词库"]) {
        
        self.tableName = tableNameOfMyWord;
        
    }
    
}


- (void)dealloc
{
 
    
    [_totailPlayerLabel release];
    [_numberOfGamePersonLabel release];
    [_totailSlider release];
    [_commonPeople release];
    [_underConver release];
    [_white release];
    [_whiteButton release];
    [_playGameButton release];
    [_backgroundMusic release];
    [_helpButton release];
    [_myBackMusic release];
    [_backImageView release];
    [_setImageView release];
    [_tableName release];
    [_tempButton release];
    
    
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
