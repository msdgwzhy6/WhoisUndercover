//
//  TLLTView.m
//  Project1
//
//  Created by God、long on 14-6-16.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "TLLTView.h"

@implementation TLLTView

- (id)initWithFrame:(CGRect)frame
{
    //为形参frame重新复制，保证初始化的LTView对象的大小为90*40
    frame = CGRectMake(frame.origin.x, frame.origin.y, 90, 40);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
       
        //为Label布局
        self.titleLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 35, 30)]autorelease];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //将Label添加到LTView上
        [self addSubview:self.titleLabel];
        
        self.numberLabel = [[[UILabel alloc]initWithFrame:CGRectMake(45, 0, 35, 30)] autorelease];
        self.numberLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:self.numberLabel];
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}




- (void)dealloc{
    [_titleLabel release];
    [_numberLabel release];
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
