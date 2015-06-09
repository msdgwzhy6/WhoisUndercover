//
//  XLCollectionCustomCell.h
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLCollectionCustomCell : UICollectionViewCell

@property (nonatomic,retain)UILabel *numberLaber;//身份牌的序号

@property (nonatomic,retain)UILabel *identityLaber;//身份label

@property (nonatomic,retain)NSString *wordString;//词语

@property (nonatomic,retain)UIImageView *backImage;//item的闪光背景

//@property (nonatomic,retain)UIImageView *headImage;//头像图片

//@property (nonatomic,retain)UIImageView *numberImage;//号码图片

//@property (nonatomic,retain)NSString *imageName;//图片名字

@end
