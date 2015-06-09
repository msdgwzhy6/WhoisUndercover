//
//  YJJAddView.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-23.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJAddView.h"

@implementation YJJAddView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //输入框
        self.textField = [[[UITextField alloc]initWithFrame:CGRectMake(20, 40, 240, 60)]autorelease];
        self.textField.placeholder = @"例如:深情的吻桌子30秒";
        self.textField.backgroundColor = [UIColor whiteColor];
        self.textField.font = [UIFont systemFontOfSize:16];
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        //标题label
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 20)]autorelease];
        self.titleLabel.text = @"贡献惩罚";
        self.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        self.titleLabel.textColor = [UIColor purpleColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //removeButton移除按钮
        self.removeButton = [[[UIButton alloc]initWithFrame:CGRectMake(263, 20 , 30, 30)]autorelease];
        [self.removeButton setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
              
        
      //提交按钮
        self.referButton = [[[UIButton alloc]initWithFrame:CGRectMake(205, 102, 80, 30)]autorelease];
        [self.referButton setTitle:@"提交" forState:UIControlStateNormal];
        [self.referButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [self.referButton setBackgroundImage:[UIImage imageNamed:@"提交1"] forState:UIControlStateNormal];
        
        
        
        
        
        //标题背景图片
        UIImageView *titleView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 10, 80, 20)];
        
        titleView.image = [UIImage imageNamed:@"添加框"];
        [titleView addSubview:self.titleLabel];
        
        //底部背景图片
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 100, 300, 140)];
        imageView.userInteractionEnabled = YES;
      //  imageView.backgroundColor = [UIColor purpleColor];
        imageView.image = [UIImage imageNamed:@"输入框背景"];
        [imageView addSubview:self.removeButton];
        [imageView addSubview:self.textField];
        [imageView addSubview:self.referButton];
        [imageView addSubview:titleView];
        [self addSubview:imageView];
        
       
        [titleView release];
        [imageView release];
        
       
        
        
        
        
        
    }
    return self;
}


















- (void)dealloc{

    [_textField release];
    [_titleLabel release];
    [_removeButton release];
    [_referButton release];
    [super dealloc];
    
}
@end
