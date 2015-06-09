//
//  YJJRootViewController.h
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-19.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YJJRootViewController : UIViewController<UIScrollViewDelegate>


@property (nonatomic , retain) UIView *belowView;
@property (nonatomic , retain) UIView *secondView;

@property (nonatomic , retain) NSArray *ADJArray;//形容词数组
@property (nonatomic , retain) NSArray *ActArray;//动作词条数组

@property (nonatomic , retain) NSMutableArray *gainArray;//获取数据后的数组







@end
