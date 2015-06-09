//
//  PeopleVeiwSecond.m
//  Project_help
//
//  Created by God、long on 14-6-19.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "PeopleVeiwSecond.h"

@implementation PeopleVeiwSecond

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       // self.backgroundColor = [UIColor cyanColor];
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:self.bounds];
        imageView1.image = [UIImage imageNamed:@"帮助1.png"];
        [self addSubview:imageView1];
        [imageView1 release];
        

        self.explainLabel = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//        self.explainLabel.backgroundColor = [UIColor purpleColor];
        [self addSubview:self.explainLabel];
        
        NSString *path = [[NSBundle mainBundle]pathForResource:@"btn_card_back" ofType:@".png"];
        
        UIImage *card1Image2 = [[UIImage alloc] initWithContentsOfFile:path];
        UIImageView *card1ImageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(80, 150, 170, 230)];
        card1ImageView2.image = card1Image2;
        [self addSubview:card1ImageView2];
        
        [card1ImageView2 release];
        [card1Image2 release];

        
        self.peopleImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(110, 160, 100, 120)]autorelease];
        [self addSubview:self.peopleImageView];
        
        self.cardNameLabel = [[[UILabel alloc]initWithFrame:CGRectMake(70, 300, 180, 50)]autorelease];
        self.cardNameLabel.textColor = [UIColor magentaColor];
        self.cardNameLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:self.cardNameLabel];
        
        
        
        
        
        
        
    }
    return self;
}



- (void)dealloc{
    [_explainLabel release];
    [_cardNameLabel release];
    [_peopleImageView release];
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
