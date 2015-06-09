//
//  XLAlertBView.m
//  WhoIsUndercover
//
//  Created by God、long on 14-6-23.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLAlertBView.h"

@implementation XLAlertBView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
               
        
        NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"alter_bg" ofType:@".png"];
        UIImage *_image = [[UIImage alloc]initWithContentsOfFile:_imagePath];
        UIImageView *_imageView = [[UIImageView alloc]initWithImage:_image];
        _imageView.frame = self.bounds ;
        [self addSubview:_imageView];
        [_image release];
        [_imageView release];
        
        
        self.alertLabel = [[[UILabel alloc]initWithFrame:CGRectMake(20, 30, 180, 30)]autorelease];
        self.alertLabel.textAlignment = NSTextAlignmentLeft;
//        self.alertLabel.textColor = [UIColor yellowColor];
//        self.alertLabel.shadowColor = [UIColor blackColor];
        self.alertLabel.shadowOffset = CGSizeMake(2, 2);
        self.alertLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.alertLabel];
        
        //取消按钮
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(20, 75, 60, 30);
        [self.cancelButton setImage:[UIImage imageNamed:@"cancel1_btn.png"] forState:UIControlStateNormal];
        [self.cancelButton setImage:[UIImage imageNamed:@"cancel1_btn_down.png"] forState:UIControlStateHighlighted];
     
        [self addSubview:self.cancelButton];
        
        
        //确定按钮
        self.okButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _okButton.frame = CGRectMake(140, 75, 60, 30);
        [self.okButton setImage:[UIImage imageNamed:@"yes_btn.png"] forState:UIControlStateNormal];
        [self.okButton setImage:[UIImage imageNamed:@"yes_btn_down.png"] forState:UIControlStateHighlighted];
       
        [self addSubview:self.okButton];
        
        
        
        
        
        
        
        
    }
    return self;
}

- (void)dealloc{
    [_alertLabel release];
    [_cancelButton release];
    [_okButton release];
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
