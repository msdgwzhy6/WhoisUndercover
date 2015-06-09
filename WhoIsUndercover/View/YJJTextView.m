//
//  YJJTextView.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-23.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJTextView.h"

@implementation YJJTextView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
       //self.backgroundColor = [UIColor yellowColor];
        
        NSArray *textArray = @[@"在这里" , @"你可以" , @"尽情释放你的演技" , @"直到朋友笑掉大牙" , @"被惩罚者" , @"看起来是你" , @"其实是他"];
        
        
        
        for (int i = 0  ; i < 7 ; i++) {
            self.textLable = [[[UILabel alloc]initWithFrame:CGRectMake(10, 70 + i *60, 300, 60)]autorelease];
            self.textLable.text = [textArray objectAtIndex:i];
            self.textLable.font = [UIFont boldSystemFontOfSize:18];
            self.textLable.backgroundColor = [UIColor clearColor];
            self.textLable.textColor = [UIColor blackColor];
            self.textLable.textAlignment = NSTextAlignmentCenter;
            [self addSubview:self.textLable];
           // [self.textLable release];
        }
       
        
        
        
        
        
        
        
    }
    return self;
}




- (void)dealloc {
    
    [_textLable release];
    [super dealloc];
}

@end
