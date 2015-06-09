//
//  XLWatchView.m
//  BeginGame
//
//  Created by God、long on 14-6-18.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import "XLWatchView.h"

@implementation XLWatchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(75, 170, 170, 230);
        [_backButton setImage:[UIImage imageNamed:@"btn_card.png"] forState:UIControlStateNormal];
        _backButton.tag = 120;
        _backButton.backgroundColor = [UIColor clearColor];
        [_backButton addTarget:self action:@selector(handleBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backButton];
        
        
     //   self.wordImageView = [[UIView alloc]initWithFrame:CGRectMake(100, 170, 120, 200)];
       // _wordView.backgroundColor = [UIColor greenColor];
        NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"btn_card_back" ofType:@".png"];
        UIImage *_image = [[[UIImage alloc]initWithContentsOfFile:_imagePath]autorelease];
        self.worImagedView = [[[UIImageView alloc]initWithImage:_image]autorelease];
        self.worImagedView.frame = CGRectMake(75, 170, 170, 230);
        self.worImagedView.userInteractionEnabled = YES;
//        [self addSubview:self.worImagedView];
//        [_image release];
//        [_worImagedView release];
        
        self.wordLabel = [[[UILabel alloc]initWithFrame:CGRectMake(20, 90, 130, 50)]autorelease];
        self.wordLabel.textAlignment = NSTextAlignmentCenter;
      
        _wordLabel.font = [UIFont systemFontOfSize:25];
        _wordLabel.textColor = [UIColor magentaColor];
        _wordLabel.tag = 122;
        [_worImagedView addSubview:_wordLabel];
     //   [_wordLabel release];
        
       self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectButton.frame = CGRectMake(60, 70, 50, 30);
        [_selectButton setTitle:@"点我" forState:UIControlStateNormal];

        [_selectButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_selectButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        //[selectHeadImageButton addTarget:self action:@selector(handleSelectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.worImagedView addSubview:_selectButton];
        

       
        
        
        
        
        
        
        
        
        
        
        
        
    }
    return self;
}




- (void)handleBackButtonAction:(UIButton *)sender
{
    
    UIButton *_button = (UIButton *)[self viewWithTag:120];
   
    
    
    [UIView transitionFromView:_button toView:_worImagedView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
        self.rememberButton.hidden = NO;
    }];
}

- (void)dealloc{

    [_worImagedView release];
    [_backButton release];
    [_rememberButton release];
    [_wordLabel release];
    [_selectButton release];
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
