//
//  XLVictoryViewController.m
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import "XLVictoryViewController.h"
#import "XLUAndCView.h"
#import "XLAppDelegate.h"
#import "XLBeginViewController.h"
#import "YJJRootViewController.h"
#import "XLWordManager.h"
#import "XLWords.h"
#import <AVFoundation/AVFoundation.h>
#import "MusicManager.h"



@interface XLVictoryViewController ()
@property (retain,nonatomic) AVAudioPlayer *victoryMusic;

@end

@implementation XLVictoryViewController



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

    self.view.backgroundColor = [UIColor clearColor];
    // Do any additional setup after loading the view.
    
    MusicManager *_musicManager = [MusicManager shariInstance];
    [_musicManager.backMusic stop];
    
    NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"bg__4" ofType:@".png"];
    UIImage *_image = [[UIImage alloc] initWithContentsOfFile:_imagePath];
    self.backImageView = [[[UIImageView alloc]initWithImage:_image]autorelease];
    _backImageView.userInteractionEnabled = YES;
    
    self.backImageView.frame = CGRectMake(0, 0, 320, 568);
    
    [self.view addSubview:_backImageView];
    [_image release];
    
    
    //增加胜利光环
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 1; i < 3 ; i ++) {
        NSString *filePath = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"shining__%d" , i] ofType:@"png"];
        UIImage *image = [[UIImage alloc]initWithContentsOfFile:filePath];
        [imageArray addObject:image];
        [image release];
    }
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 300)];
    imageView.animationImages = imageArray;
    imageView.animationDuration = 0.4;
    imageView.tag = 168;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
    [self.view addSubview:imageView];
    [imageView release];

      //胜利Label
    if ([self.identityString isEqualToString:@"卧底"]) {
        
        NSString *musicFilePath = [[NSBundle mainBundle]pathForResource:@"卧底胜利" ofType:@"wav"];
        NSURL *musicURL = [[[NSURL alloc]initFileURLWithPath:musicFilePath] autorelease];
        NSError *error;
        self.victoryMusic = [[[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:&error]autorelease];
        
        if (error) {
            NSLog(@"error = %@",[error localizedDescription]);
        }
        [self.victoryMusic prepareToPlay];
        
        //设置音量大小
        [self.victoryMusic setVolume:1];
        
        //音乐循环次数，-1为一直循环
        self.victoryMusic.numberOfLoops = 0;
        //    //设置开关的初始为开，并且播放音乐
        //    self.backgroundMusic.on = YES;
        [self.victoryMusic play];

        
        if (self.numberOfGamePerson <= 9) {
            
            
            NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"under_win_bg" ofType:@".png"];
            UIImage *_image = [[UIImage alloc]initWithContentsOfFile:_imagePath];
            UIImageView *victoryView = [[UIImageView alloc]initWithImage:_image];
            victoryView.frame = CGRectMake(20, 80, 280, 150);
            [self.view addSubview:victoryView];
            [_image release];
            [victoryView release];
            
            //"谁是卧底"Label
            UILabel *_numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(120, 90, 80, 30)];
            _numberOfUndercoverLaber.textAlignment = NSTextAlignmentCenter;
            _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@",[self.undercoverArray objectAtIndex:0]];
            [victoryView addSubview:_numberOfUndercoverLaber];
            [_numberOfUndercoverLaber release];

        } else {
            
        NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"under_win_bg" ofType:@".png"];
        UIImage *_image = [[UIImage alloc]initWithContentsOfFile:_imagePath];
        UIImageView *victoryView = [[UIImageView alloc]initWithImage:_image];
        victoryView.frame = CGRectMake(20, 80, 280, 150);
        [self.view addSubview:victoryView];
        [_image release];
        [victoryView release];
        
        //"谁是卧底"Label
        UILabel *_numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(130, 90, 80, 30)];
         _numberOfUndercoverLaber.textAlignment = NSTextAlignmentCenter;

        _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@,%@",[self.undercoverArray objectAtIndex:0 ],[self.undercoverArray objectAtIndex:1]];
        [victoryView addSubview:_numberOfUndercoverLaber];
        [_numberOfUndercoverLaber release];
        
        }
        
        
    } else if([self.identityString isEqualToString:@"平民"]){
        
        
        NSString *musicFilePath = [[NSBundle mainBundle]pathForResource:@"victory" ofType:@"mp3"];
        NSURL *musicURL = [[[NSURL alloc]initFileURLWithPath:musicFilePath] autorelease];
        NSError *error;
        self.victoryMusic = [[[AVAudioPlayer alloc]initWithContentsOfURL:musicURL error:&error]autorelease];
        
        if (error) {
            NSLog(@"error = %@",[error localizedDescription]);
        }
        [self.victoryMusic prepareToPlay];
        
        //设置音量大小
        [self.victoryMusic setVolume:1];
        
        //音乐循环次数，-1为一直循环
        self.victoryMusic.numberOfLoops = 0;
        //    //设置开关的初始为开，并且播放音乐
        //    self.backgroundMusic.on = YES;
        [self.victoryMusic play];

        
        
        
        NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"civilian_win_bg" ofType:@".png"];
        UIImage *_image = [[UIImage alloc]initWithContentsOfFile:_imagePath];
        UIImageView *victoryView = [[UIImageView alloc]initWithImage:_image];
        victoryView.frame = CGRectMake(20, 80, 280, 150);
        [self.view addSubview:victoryView];
        [_image release];
        [victoryView release];
        if (self.numberOfGamePerson <= 9) {
            //"谁是卧底"Label
            UILabel *_numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(90, 250, 140, 30)];
            _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@是卧底!",[self.undercoverArray objectAtIndex:0 ]];
            _numberOfUndercoverLaber.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:_numberOfUndercoverLaber];
            [_numberOfUndercoverLaber release];
        } else{
            
        //"谁是卧底"Label
        UILabel *_numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(90, 250, 140, 30)];
        _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@,%@是卧底!",[self.undercoverArray objectAtIndex:0],[self.undercoverArray objectAtIndex:1]];
        _numberOfUndercoverLaber.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_numberOfUndercoverLaber];
        [_numberOfUndercoverLaber release];
            
        }


    } else {
        
        NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"white_win_bg" ofType:@".png"];
        UIImage *_image = [[UIImage alloc]initWithContentsOfFile:_imagePath];
        UIImageView *victoryView = [[UIImageView alloc]initWithImage:_image];
        victoryView.frame = CGRectMake(20, 80, 280, 150);
        [self.view addSubview:victoryView];
        [_image release];
        [victoryView release];
        
        if (self.numberOfGamePerson <= 9) {
            //"谁是卧底"Label
            UILabel *_numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(90, 250, 140, 30)];
            _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@是卧底!",[self.undercoverArray objectAtIndex:0]];
            _numberOfUndercoverLaber.textAlignment = NSTextAlignmentCenter;

            [self.view addSubview:_numberOfUndercoverLaber];
            [_numberOfUndercoverLaber release];
        } else {
            
        //"谁是卧底"Label
        UILabel *_numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(90, 250, 140, 30)];
            _numberOfUndercoverLaber.textAlignment = NSTextAlignmentCenter;

        _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@,%@是卧底!",[self.undercoverArray objectAtIndex:0],[self.undercoverArray objectAtIndex:1]];
        [self.view addSubview:_numberOfUndercoverLaber];
        [_numberOfUndercoverLaber release];
        
        }
        

    }
    

    

//    //"谁是卧底"Label
//    UILabel *_147numberOfUndercoverLaber = [[UILabel alloc]initWithFrame:CGRectMake(110, 200, 100, 30)];
//    _numberOfUndercoverLaber.text = [NSString stringWithFormat:@"%@是卧底!",self.numberString];
//    [self.view addSubview:_numberOfUndercoverLaber];
//    [_numberOfUndercoverLaber release];
    

    
    
    //卧底词，平民词
    XLUAndCView *uAndCViewOne = [[XLUAndCView alloc]initWithFrame:CGRectMake(50, 330, 210, 30)];
    NSString *_imagePathOfCivilian = [[NSBundle mainBundle]pathForResource:@"civilian_word" ofType:@".png"];
    UIImage *_imageOfCivilian = [[[UIImage alloc]initWithContentsOfFile:_imagePathOfCivilian]autorelease];
    uAndCViewOne.oneImageView.image = _imageOfCivilian;
    uAndCViewOne.twoLabel.text = self.undercoverString;
    
    
    XLUAndCView *uAndCViewTwo = [[XLUAndCView alloc]initWithFrame:CGRectMake(50, 360, 210, 30)];
    NSString *_imagePathOfUnder = [[NSBundle mainBundle]pathForResource:@"under_word" ofType:@".png"];
    UIImage *_imageOfUnder = [[[UIImage alloc]initWithContentsOfFile:_imagePathOfUnder]autorelease];
    uAndCViewTwo.oneImageView.image = _imageOfUnder;
    uAndCViewTwo.twoLabel.text = self.civilianString;
    
    [self.view addSubview:uAndCViewOne];
    [uAndCViewOne release];
    
    [self.view addSubview:uAndCViewTwo];
    [uAndCViewTwo release];
    
    //收藏按钮
    self.collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.collectButton.frame = CGRectMake(230, 350, 45, 35);
    [self.collectButton setImage:[UIImage imageNamed:@"btn_liked.png"] forState:UIControlStateNormal];
    [self.collectButton addTarget:self action:@selector(handleCollectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.collectButton];
    
    
    
    
    //惩罚输家Button
    self.punishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    

    [_punishButton setImage:[UIImage imageNamed:@"punishment.png"] forState:UIControlStateNormal];
    [_punishButton setImage:[UIImage imageNamed:@"punishment_down"] forState:UIControlStateHighlighted];
    [_punishButton setFrame:CGRectMake(110, 430, 100, 35)];
    [_punishButton addTarget:self action:@selector(handlePunishButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_punishButton];
    
    
    //重新开始Button
    self.againButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_againButton setImage:[UIImage imageNamed:@"again_btn.png"] forState:UIControlStateNormal];
    [_againButton setImage:[UIImage imageNamed:@"again_btn_down"] forState:UIControlStateHighlighted];
    [_againButton setFrame:CGRectMake(125, 520, 70, 35)];
    [_againButton addTarget:self action:@selector(handleAgainButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_againButton];
    
    /*
    //添加左下角的返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(20, 515, 50, 50);
    [self.backButton setImage:[UIImage imageNamed:@"fanhui__2.png"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"fanhuied__2.png"] forState:UIControlStateHighlighted];
    
    [self.backButton addTarget:self action:@selector(handleBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];

   // NSLog(@"dddddddddddddd%d",self.navigationController.viewControllers.count);

    
       
    */
    
    
    
}

- (void)handleCollectButton:(UIButton *)sender
{
    [sender setImage:[UIImage imageNamed:@"btn_like.png"] forState:UIControlStateNormal];

   // sender.enabled = NO;
    NSString *infoString;
    XLWordManager *_manager = [XLWordManager sharedInstance];
    _manager.type = tableNameOfMyWord;
    BOOL isAdd = YES;
    NSMutableArray *_wordArray = [_manager wordsList];
    for (XLWords *word in _wordArray) {
        
        if ([self.civilianString isEqualToString:word.wordOfCivilian] ) {
            isAdd = NO;
        }
    }
    if (isAdd) {
        
        XLWords *word = [XLWords wordWithWordOfCivilian:self.civilianString wordOfUndercover:self.undercoverString];
        [_manager insertWordsItem:word];
        infoString = @"已添加到我的词库!";
        
    } else {
        infoString = @"已经收藏了哦!亲!";
    }
    
    UILabel *alterText = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, 300, 30)];
    alterText.text = infoString;
    alterText.font = [UIFont systemFontOfSize:15];
    alterText.textAlignment = NSTextAlignmentCenter;
    alterText.textColor = [UIColor yellowColor];
    [self.view addSubview:alterText];
    [alterText release];
    //渐隐
    [UIView animateWithDuration:1 animations:^{
        alterText.alpha = 0;
    }];
    //移除
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alterText removeFromSuperview];
        
    });

    
    
    
    
    
}

//返回按钮的实现
/*
- (void)handleBackButtonAction:(UIButton *)sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
*/
//点击 惩罚输家Button的实现
- (void)handlePunishButtonAction:(UIButton *)sender
{
    YJJRootViewController *rootVC = [[YJJRootViewController alloc]init];
    [self presentViewController:rootVC animated:YES completion:nil];
    [rootVC release];
    
}


//亟待解决的问题。。。。。重新开始游戏
- (void)handleAgainButtonAction:(UIButton *)sender
{
    //XLBeginViewController *secondVC = [[XLBeginViewController alloc]init];
    [self.navigationController popToRootViewControllerAnimated:YES];

   // TLViewController *firstVC = [self.navigationController.viewControllers objectAtIndex:0];
        XLBeginViewController *secondVC = [self.navigationController.viewControllers objectAtIndex:0];
    
    [self.navigationController popToViewController:secondVC animated:YES];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{

    [_identityString release];
    [_civilianString release];
    [_undercoverString release];
    [_numberString release];
    [_punishButton release];
    [_againButton release];
    [_backButton release];
    [_backImageView release];
    [_undercoverArray release];
    [_victoryMusic release];
    
    [super dealloc];
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
