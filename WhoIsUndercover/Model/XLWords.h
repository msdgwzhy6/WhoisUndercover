//
//  XLWords.h
//  WhoIsUndercover
//
//  Created by God、long on 14-6-20.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLWords : NSObject

//@property (nonatomic,assign)int number;//主号

@property (nonatomic,retain)NSString *wordOfCivilian;//平民词

@property (nonatomic,retain)NSString *wordOfUndercover;//卧底词

- (id)initWithWordOfCivilian:(NSString *)wordOfCivilian
            wordOfUndercover:(NSString *)wordOfUndercover;

+ (id)wordWithWordOfCivilian:(NSString *)wordOfCivilian
            wordOfUndercover:(NSString *)wordOfUndercover;


@end
