//
//  MusicManager.m
//  WhoIsUndercover
//
//  Created by TL on 14-7-3.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "MusicManager.h"

static MusicManager *music = nil;

@implementation MusicManager
+ (id)shariInstance{
    if (!music) {
        music = [[MusicManager alloc]init];
    }
    return music;
}

-(void)dealloc
{
    [_backMusic release];
    [super dealloc];
}

@end
