//
//  YJJWordGourpItem.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-25.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJWordGourpItem.h"

@implementation YJJWordGourpItem

- (id)initWithADJArray:(NSArray *)adjArray{
    if (self = [super init]) {
        self.ADJArray =adjArray;
    }
   
  
    return self;
}

- (id)initWithActArray:(NSArray *)actArray{
    
    if (self = [super init]) {
        self.ActArray = actArray;

    }
    
    return self;
}

- (void)dealloc
{
    [_ActArray release];
    [_ADJArray release];
    [super dealloc];
}



@end
