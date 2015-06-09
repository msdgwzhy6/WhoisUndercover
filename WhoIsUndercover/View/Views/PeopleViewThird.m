//
//  PeopleViewThird.m
//  Project_help
//
//  Created by God、long on 14-6-19.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "PeopleViewThird.h"

@implementation PeopleViewThird

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cardDescribe = [[[UIImageView alloc]initWithFrame:CGRectMake(120, 120, 150, 150)] autorelease];
//        self.cardDescribe.back groundColor = [UIColor redColor];
        [self addSubview:self.cardDescribe];
        
        self.peopleImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(50, 250, 220, 250)] autorelease];
//        self.people.backgroundColor = [UIColor greenColor];
        [self addSubview:self.peopleImageView];

     
    }
    return self;
}


- (void)dealloc{
    [_cardDescribe release];
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
