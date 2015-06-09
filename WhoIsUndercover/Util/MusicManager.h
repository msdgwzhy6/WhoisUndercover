//
//  MusicManager.h
//  WhoIsUndercover
//
//  Created by TL on 14-7-3.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface MusicManager : NSObject

@property (retain,nonatomic) AVAudioPlayer *backMusic;
+ (id)shariInstance;

@end
