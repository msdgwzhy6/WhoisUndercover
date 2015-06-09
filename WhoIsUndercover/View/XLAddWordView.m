//
//  XLAddWordView.m
//  WhoIsUndercover
//
//  Created by God、long on 14-7-1.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLAddWordView.h"

@implementation XLAddWordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        NSString *pathOfbg = [[NSBundle mainBundle]pathForResource:@"tablebg_1" ofType:@".png"];
        UIImage *_imageOfbg = [[UIImage alloc]initWithContentsOfFile:pathOfbg];
        UIImageView *_imageViewOfbg = [[UIImageView alloc]initWithImage:_imageOfbg];
        _imageViewOfbg.frame = self.bounds;
        [self addSubview:_imageViewOfbg];
        [_imageViewOfbg release];
        [_imageOfbg release];
        
        
        self.labelOne = [[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 80, 40)]autorelease];
        _labelOne.text = @"平民词：";
        [self addSubview:_labelOne];
       // [_labelOne release];
        
        
        self.civilianTextField = [[[UITextField alloc]initWithFrame:CGRectMake(100, 30, 170, 40)]autorelease];
        _civilianTextField.placeholder = @"请输入平民词";
        [self addSubview:_civilianTextField];
        
        
        self.labelTwo = [[[UILabel alloc]initWithFrame:CGRectMake(10, 90, 80, 40)]autorelease];
        _labelTwo.text = @"卧底词:";
        [self addSubview:_labelTwo];
       // [_labelTwo release];
        
        
        self.underTextField = [[[UITextField alloc]initWithFrame:CGRectMake(100, 90, 170, 40)]autorelease];
        _underTextField.placeholder = @"请输入卧底词";
        [self addSubview:_underTextField];
      //  [_underTextField release];
        
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.frame = CGRectMake(60, 190, 50, 30);
        [_cancelButton setImage:[UIImage imageNamed:@"cancle_1.png"] forState:UIControlStateNormal];
       // [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_cancelButton];
        
        self.okButton = [UIButton buttonWithType:UIButtonTypeCustom ];
        _okButton.frame = CGRectMake(170, 190, 50, 30);
        [_okButton setImage:[UIImage imageNamed:@"add_1.png"] forState:UIControlStateNormal];
      //  [_okButton setTitle:@"增加" forState:UIControlStateNormal];
        [self addSubview:_okButton];
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}

-(void)dealloc
{
    [_labelOne release];
    [_labelTwo release];
    [_civilianTextField release];
    [_underTextField release];
    [_okButton release];
    [_cancelButton release];
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
