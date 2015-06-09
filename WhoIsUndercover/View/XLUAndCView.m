//
//  XLUAndCView.m
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import "XLUAndCView.h"

@implementation XLUAndCView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
      
        self.oneImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 60, 20)]autorelease];
     

        
        
        self.twoLabel = [[[UILabel alloc]initWithFrame:CGRectMake(85, 5, 80, 30)]autorelease];
        [self.twoLabel setTextAlignment:NSTextAlignmentLeft];
        self.twoLabel.font = [UIFont systemFontOfSize:18];
       
        [self addSubview:_oneImageView];
        [self addSubview:_twoLabel];

        

        
        
    }
    return self;
}

- (void)dealloc
{
    [_oneImageView release];
    [_twoLabel release];
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
