//
//  XLSlide.m
//  WhoIsUndercover
//
//  Created by God、long on 14-6-19.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLSlide.h"

@implementation XLSlide

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.stringArray = @[@"世界杯",@"娱乐圈",@"朋友",@"校园",@"家庭",@"小清新",@"词库"];
        
        self.titleScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(20, 0, 280, 80)]autorelease];
        _titleScrollView.contentSize = CGSizeMake(490, 0);
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        _titleScrollView.bounces = YES;
        _titleScrollView.backgroundColor = [UIColor clearColor];
       
        
        
        
        for (int i = 0; i < self.stringArray.count; i++) {
            UIButton *_button = [UIButton buttonWithType:UIButtonTypeCustom];
            _button.frame = CGRectMake(i * 70 + 5, 10, 60, 60);
            _button.tag = 120 + i;
            [_button setTitle:[NSString stringWithFormat:@"%@",[self.stringArray objectAtIndex:i]] forState:UIControlStateNormal];
            [_button setImage:[UIImage imageNamed:@"slide.png"] forState:UIControlStateNormal];
            UILabel *_wordLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, 50, 40)];
            _wordLabel.text = [self.stringArray objectAtIndex:i];
            _wordLabel.font = [UIFont systemFontOfSize:12];
            _wordLabel.textColor = [UIColor blueColor];
            _wordLabel.textAlignment = NSTextAlignmentCenter;
            [_button addSubview:_wordLabel];
            [_wordLabel release];
            
            [self.titleScrollView addSubview:_button];
        }
        
         [self addSubview:self.titleScrollView];
        
        self.button1 = (UIButton *)[self viewWithTag:120];
        self.button2 = (UIButton *)[self viewWithTag:121];
        self.button3 = (UIButton *)[self viewWithTag:122];
        self.button4 = (UIButton *)[self viewWithTag:123];
        self.button5 = (UIButton *)[self viewWithTag:124];
        self.button6 = (UIButton *)[self viewWithTag:125];
        self.button7 = (UIButton *)[self viewWithTag:126];
        
        //创建滑动视图的左右按钮
        self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 20, 20, 40);
        [_leftButton setImage:[UIImage imageNamed:@"left.png"] forState:UIControlStateNormal];
//        [_leftButton setTitle:@"L" forState:UIControlStateNormal];
//        [_leftButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
 //       [_leftButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_leftButton addTarget:self action:@selector(handleLeftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.leftButton];
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(300, 20, 20, 40);
        [_rightButton setImage:[UIImage imageNamed:@"rigth.png"] forState:UIControlStateNormal];
//        [_rightButton setTitle:@"R" forState:UIControlStateNormal];
//        [_rightButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
//        [_rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_rightButton addTarget:self action:@selector(handleRightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightButton];

        
        
        
        
        
        
        
    }
    return self;
}

- (void)handleLeftButtonAction:(UIButton *)sender
{
    CGFloat x = self.titleScrollView.contentOffset.x;
    if (x >= 60) {
        self.titleScrollView.contentOffset = CGPointMake(x - 70, 0);
    }

}

- (void)handleRightButtonAction:(UIButton *)sender
{
    CGFloat x = self.titleScrollView.contentOffset.x;
    if (x <= 190) {
        self.titleScrollView.contentOffset = CGPointMake(x + 70, 0);

    }
    
}


- (void)dealloc
{

    
    [_titleScrollView release];
    [_leftButton release];
    [_rightButton release];
    [_button1 release];
    [_button2 release];
    [_button3 release];
    [_button4 release];
    [_button5 release];
    [_button6 release];
    [_button7 release];
    [_button8 release];
    [_stringArray release];
    
    
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
