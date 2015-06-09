//
//  XLBeginViewController.h
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLWatchView.h"



@interface XLBeginViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic,retain)UICollectionView *collectionView;//单元格显示,布局


@property (nonatomic,retain)NSArray *dataArray;//数据源数组,暂定存图片的数组


@property (nonatomic,assign)NSInteger numberGamePersons;//游戏人数

 
@property (nonatomic,assign)NSInteger numberAllOfGamePerson;


@property (nonatomic,assign)NSInteger numberOfCivilian;//平民数量


@property (nonatomic,assign)NSInteger numberOfUndercover;//卧底数量


@property (nonatomic,assign)NSInteger numberOfWhiteBoard;//白板数量




@property (nonatomic,retain)NSString *wordOfCivilian;//平民词语


@property (nonatomic,retain)NSString *wordOfUndercover;//卧底词语

@property (nonatomic,retain)UIButton *backButton;//返回按钮


@property (nonatomic,retain)UILabel *noticeLabel;//提醒Label

 


@end
