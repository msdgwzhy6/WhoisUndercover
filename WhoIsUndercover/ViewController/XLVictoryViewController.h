//
//  XLVictoryViewController.h
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLVictoryViewController : UIViewController

@property (nonatomic,retain)NSString *identityString;//传过来胜利者的身份

@property (nonatomic,retain)NSString *civilianString;//传过来的平民词

@property (nonatomic,retain)NSString *undercoverString;//穿过来的卧底词

@property (nonatomic,retain)NSString *numberString;//传过来卧底的号码

@property (nonatomic,retain)UIButton *punishButton;//惩罚按钮

@property (nonatomic,retain)UIButton *collectButton;//收藏按钮

@property (nonatomic,retain)UIButton *againButton;//重新开始按钮

@property (nonatomic,retain)UIButton *backButton;//返回按钮

@property (nonatomic,retain)UIImageView *backImageView;//背景图片

@property (nonatomic,retain)NSMutableArray *undercoverArray;//卧底数组

@property (nonatomic,assign)NSInteger numberOfGamePerson;//游戏总人数

@end
