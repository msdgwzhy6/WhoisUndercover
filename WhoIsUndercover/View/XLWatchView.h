//
//  XLWatchView.h
//  BeginGame
//
//  Created by God、long on 14-6-18.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol XLWatchViewDeledate <NSObject>
//
//- (void)handleSelectButtonAction:(UIButton *)sender;
//
//@end




@interface XLWatchView : UIView

@property (nonatomic,retain)UIImageView *worImagedView;//身份词View

@property (nonatomic,retain)UIButton *backButton;//beijing

@property (nonatomic,retain)UIButton *rememberButton;//传过来的rememberButton

@property (nonatomic,retain)UILabel *wordLabel;//身份词Label

@property (nonatomic,retain)UIButton *selectButton;//选择头像的Button

//@property (nonatomic,assign)id<XLWatchViewDeledate> delegate;

@end
