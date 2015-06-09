//
//  YJJWordGourpItem.h
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-25.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJJWordGourpItem : NSObject


@property (nonatomic , retain) NSArray *ADJArray;//形容词数组
@property (nonatomic , retain) NSArray *ActArray;//动作词条数组

- (id)initWithADJArray:(NSArray *)adjArray;
- (id)initWithActArray:(NSArray *)actArray;




@end
