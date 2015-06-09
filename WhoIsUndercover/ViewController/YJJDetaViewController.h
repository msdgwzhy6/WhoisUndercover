//
//  YJJDetaViewController.h
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-21.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YJJTableView;
@class YJJAddView;
@class YJJWordGourpItem;

@interface YJJDetaViewController : UIViewController<UITableViewDataSource , UITableViewDelegate>

@property (nonatomic , retain) UITableView *defaultTableView;//默认表视图
@property (nonatomic , retain) UITableView *collectTableView;//收藏表视图
@property (nonatomic , retain) UITableView *contributionTableView;//贡献视图
@property (nonatomic , retain) NSMutableArray *dataArray;//数据源数组
@property (nonatomic , retain) NSMutableArray *gainArray;//获取数据后的数组
@property (nonatomic , retain) NSMutableArray *addArray;//添加新词条的数组

@property (nonatomic,assign)NSString *count;//被观察者

@end
