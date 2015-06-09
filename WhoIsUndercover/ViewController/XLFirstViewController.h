//
//  XLFirstViewController.h
//  WhoIsUndercover
//
//  Created by God、long on 14-6-24.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class TLLTView;

@interface XLFirstViewController : UIViewController

//玩家人数Label
@property (retain,nonatomic) UILabel *totailPlayerLabel;

//玩家人数Label
@property (nonatomic,retain) UILabel *numberOfGamePersonLabel;//显示游戏总人数


//玩家人数Slider
@property (retain,nonatomic) UISlider *totailSlider;

//平民
@property (retain,nonatomic) TLLTView *commonPeople;

//卧底
@property (retain,nonatomic) TLLTView *underConver;

//白板的Label和Switch
@property (retain,nonatomic) UILabel *white;


@property (retain,nonatomic)UIButton *whiteButton;//白板按钮

//开始游戏Button
@property (retain,nonatomic) UIButton *playGameButton;

//返回按钮
@property (retain,nonatomic) UIButton *backgroundMusic;

//帮助按钮
@property (retain,nonatomic) UIButton *helpButton;


@property (retain,nonatomic) AVAudioPlayer *myBackMusic;


@property (nonatomic,retain)UIImageView *backImageView;//背景图片

@property (nonatomic,retain)UIImageView *setImageView;//游戏人数设置的背景

@end
