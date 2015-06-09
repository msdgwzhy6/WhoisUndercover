//
//  XLCollectionCustomCell.m
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import "XLCollectionCustomCell.h"

@implementation XLCollectionCustomCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //设置cell的背景色
    
        self.backgroundColor = [UIColor cyanColor];
        //初始化numberLaber
        self.numberLaber = [[[UILabel alloc]initWithFrame:self.bounds] autorelease];
        //self.numberLaber.textAlignment = NSTextAlignmentCenter;
        //self.numberLaber.textColor = [UIColor blackColor];
        
        //初始化identityLaber
        self.identityLaber = [[[UILabel alloc]initWithFrame:self.bounds] autorelease];
        self.identityLaber.textAlignment = NSTextAlignmentCenter;
        self.identityLaber.font = [UIFont systemFontOfSize:16];
        self.identityLaber.textColor = [UIColor blackColor];
        
        //添加头像图片
        
        
        
        
        
        
        
        //初始化backView
        NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"light" ofType:@".png"];
        UIImage *_image = [UIImage imageWithContentsOfFile:_imagePath];
        self.backImage = [[[UIImageView alloc]initWithImage:_image  ]autorelease];
       
        self.backImage.frame = CGRectMake(-5, -5.0, 61, 61);
        // self.backImage.center = self.center;

        [self addSubview:self.backImage];
        [self addSubview:self.identityLaber];
       // [self addSubview:self.numberLaber];
        
       // [_backImage release];
       // [_numberLaber release];
      //  [_identityLaber release];
        
//        NSString *_imagePathOfNumber = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",self.imageName] ofType:@".png"];
//        UIImage *_imageOfNumber = [[UIImage alloc] initWithContentsOfFile:_imagePathOfNumber];
//        self.numberImage = [[UIImageView alloc]initWithImage:_imageOfNumber];
//        
//        self.numberImage.frame = CGRectMake(21, 0, 30, 30);
//
//        [self addSubview:self.numberImage];
//        [_imageOfNumber release];
//        [_numberImage release];
        
        
        
        
        
    }
    return self;
}

- (void)dealloc
{

    [_numberLaber release];
    [_identityLaber release];
    [_wordString release];
    [_backImage release];
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
