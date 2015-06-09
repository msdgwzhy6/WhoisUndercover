//
//  XLWords.m
//  WhoIsUndercover
//
//  Created by God、long on 14-6-20.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLWords.h"

@implementation XLWords

- (id)initWithWordOfCivilian:(NSString *)wordOfCivilian wordOfUndercover:(NSString *)wordOfUndercover
{
    
    if (self = [super init]) {
        
        self.wordOfCivilian = wordOfCivilian;
        self.wordOfUndercover = wordOfUndercover;
    }
    return self;

}

+ (id)wordWithWordOfCivilian:(NSString *)wordOfCivilian wordOfUndercover:(NSString *)wordOfUndercover
{
    
    XLWords *words = [[[XLWords alloc]initWithWordOfCivilian:wordOfCivilian wordOfUndercover:wordOfUndercover]autorelease];
    
    return words;

}

-(void)dealloc
{
    [_wordOfCivilian release];
    [_wordOfUndercover release];
    [super dealloc];
}

- (NSString *)description
{
    
    return [NSString stringWithFormat:@"wordOfCivilian = %@ , wordOfUndercover = %@. \n",_wordOfCivilian,_wordOfUndercover];
    
}








@end
