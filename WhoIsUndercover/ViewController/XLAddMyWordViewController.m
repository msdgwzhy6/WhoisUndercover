//
//  XLAddMyWordViewController.m
//  WhoIsUndercover
//
//  Created by God、long on 14-7-1.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLAddMyWordViewController.h"
#import "XLMyWordTableViewCell.h"
#import "XLWordManager.h"
#import "XLWords.h"
#import "XLAllWordOfType.h"
#import "XLAddWordView.h"
#import "UIView+GetBackgroundImage.h"
#import "UIImage+BlurImage.h"


@interface XLAddMyWordViewController ()


@property (nonatomic,retain)NSMutableArray *wordArray;

@end

@implementation XLAddMyWordViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //设置背景图片
    
    NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"addmywordbc__1" ofType:@".png"];
    UIImage *_image = [[UIImage alloc] initWithContentsOfFile:_imagePath];
    UIImageView *_backImageView = [[UIImageView alloc]initWithImage:_image];
    _backImageView.userInteractionEnabled = YES;
    
    _backImageView.frame = self.view.bounds;
    
    [self.view addSubview:_backImageView];
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background_5.png"]];
    [_backImageView release];
    [_image release];

    NSString *pathOfword = [[NSBundle mainBundle]pathForResource:@"word_2" ofType:@".png"];
    UIImage *_imageOfword = [[UIImage alloc]initWithContentsOfFile:pathOfword];
    UIImageView *_imageViewOfword = [[UIImageView alloc]initWithImage:_imageOfword];
    _imageViewOfword.frame = CGRectMake( 30,30,260,50 );
    [self.view addSubview:_imageViewOfword];
    [_imageViewOfword release];
    [_imageOfword release];
    

    
    
    
    NSString *pathOftitle = [[NSBundle mainBundle]pathForResource:@"titlebg_3" ofType:@".png"];
    UIImage *_imageOftitle = [[UIImage alloc]initWithContentsOfFile:pathOftitle];
    UIImageView *_imageViewOftitle = [[UIImageView alloc]initWithImage:_imageOftitle];
    _imageViewOftitle.frame = CGRectMake( 30,90,260,30 );
    [self.view addSubview:_imageViewOftitle];
    [_imageViewOftitle release];
    [_imageOftitle release];
    

    
    
    
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"tablebg_1" ofType:@".png"];
    UIImage *_imageOfsele = [[UIImage alloc]initWithContentsOfFile:path];
    UIImageView *_imageViewOfsele = [[UIImageView alloc]initWithImage:_imageOfsele];
    _imageViewOfsele.frame = CGRectMake(locaX * 1 / 8 - 12, locaY * 1 / 4 - 12, locaX * 3 / 4 + 24 , locaY * 5 / 8 );
    [self.view addSubview:_imageViewOfsele];
    [_imageViewOfsele release];
    [_imageOfsele release];

    
    self.myWordTableView = [[[UITableView alloc]initWithFrame:CGRectMake(locaX * 1 / 8, locaY * 1 / 4 , locaX * 3 / 4, locaY * 5 / 8 - 20)]autorelease];
    self.myWordTableView.backgroundColor = [UIColor clearColor];
    self.myWordTableView.delegate = self;
    self.myWordTableView.dataSource = self;
    [self.view addSubview:self.myWordTableView];
    //[_myWordTableView release];
    
    [self.myWordTableView registerClass:[XLMyWordTableViewCell class] forCellReuseIdentifier:myWordCellIdentifier];
    
    
    
    
    
    
    
    
    
    
    
    
    //数据源
    
    XLWordManager *_manager = [XLWordManager sharedInstance];
    _manager.type = tableNameOfMyWord;
    
    self.wordArray = [_manager wordsList];
   
    //添加返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(20, 500, 50,50);
    [backButton setImage:[UIImage imageNamed:@"fanhui__2.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"fanhuied__2.png"] forState:UIControlStateHighlighted];
    
    [backButton addTarget:self action:@selector(handleBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    
    
    //添加加词按钮
    UIButton *addWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addWordButton.frame = CGRectMake(250, 89, 30, 30);
    [addWordButton setImage:[UIImage imageNamed:@"edit_plus_btn.png"] forState:UIControlStateNormal];
    [addWordButton addTarget:self action:@selector(handleAddWordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addWordButton];
    
    
    
    
    
    
}
//添加词语按钮的实现
- (void)handleAddWordButtonAction:(UIButton *)sender
{
    
    UIImage *screenViewImage = [self.view screenShot];
    
    
    UIImage *blurImage = [screenViewImage re_applyBlurWithRadius:10 tintColor:[UIColor clearColor] saturationDeltaFactor:1 maskImage:nil];
    
    UIImageView *screenView = [[UIImageView alloc]initWithImage:blurImage];
    screenView.frame = self.view.bounds;
    screenView.alpha=0;
    screenView.tag = 156;
    screenView.userInteractionEnabled = YES;
    
    
    [self.view addSubview:screenView];
    [screenView release];
    
    [UIView animateWithDuration:0.5 animations:^{
        screenView.alpha=1;
    }];

    
    
    XLAddWordView *addWordView = [[XLAddWordView alloc]initWithFrame:CGRectMake(20, 80, 280, 250)];
    [addWordView.cancelButton addTarget:self action:@selector(handleCancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [addWordView.okButton addTarget:self action:@selector(handleOkButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    


    
    
    
    [self.view addSubview:addWordView];
    [addWordView release];
    
    
}
//添加词语视图中取消按钮的实现
- (void)handleCancelButtonAction:(UIButton *)sender
{
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:156];
    [imageView removeFromSuperview];
    [sender.superview removeFromSuperview];
}
//添加词语视图中增加按钮的实现
- (void)handleOkButtonAction:(UIButton *)sender
{
    
    

    NSString *infoString;
    XLAddWordView *addView = (XLAddWordView *)sender.superview;
    NSString *wordOfCivilian = addView.civilianTextField.text;
    NSString *wordOfUndercover = addView.underTextField.text;
    BOOL isAdd = YES;
    
    
    if ([wordOfCivilian isEqualToString:@""] || [wordOfUndercover  isEqualToString:@""]) {
        infoString = @"添加的词条不能为空!";
        isAdd = NO;
    }else {
        
        for (XLWords *word in self.wordArray) {
            if ([word.wordOfCivilian isEqualToString:wordOfCivilian] && [word.wordOfUndercover isEqualToString:wordOfUndercover]) {
                infoString = @"添加的词条已存在!";
                isAdd = NO;
            }
            
        }
        
    }
    
    if (isAdd) {
        XLWordManager *_manager = [XLWordManager sharedInstance];
        _manager.type = tableNameOfMyWord;
        XLWords *word = [XLWords wordWithWordOfCivilian:wordOfCivilian wordOfUndercover:wordOfUndercover];

          [_manager insertWordsItem:word];

        infoString = @"增加成功";
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:156];
        [imageView removeFromSuperview];
        [addView removeFromSuperview];
        
    }
    
    XLWordManager *_manager = [XLWordManager sharedInstance];
    _manager.type = tableNameOfMyWord;
    
    self.wordArray = [_manager wordsList];
    [self.myWordTableView reloadData];
    
    
    UILabel *alterTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 85, 240, 30)];
    alterTextLabel.text = infoString;
    alterTextLabel.backgroundColor = [UIColor blackColor];
    alterTextLabel.textColor = [UIColor whiteColor];
    alterTextLabel.font = [UIFont systemFontOfSize:15];
    alterTextLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:alterTextLabel];
    [alterTextLabel release];
    //渐隐
    [UIView animateWithDuration:2 animations:^{
        alterTextLabel.alpha = 0;
    }];
    //移除
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alterTextLabel removeFromSuperview];
        
    });

    
    
    
    
}


//返回按钮的实现
- (void)handleBackButtonAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _wordArray.count;
}

//单元格的创建
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    XLMyWordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myWordCellIdentifier];
    UIImageView *cellBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cell_3.png"]];
    cell.backgroundView = cellBackgroundView;
    [cellBackgroundView release];
    tableView.allowsSelection = NO;
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    XLWords *word = [_wordArray objectAtIndex:indexPath.row];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        cell.civilianLabel.text = word.wordOfCivilian;
        cell.undercoverLabel.text = word.wordOfUndercover;
    [cell.deleteButton addTarget:self action:@selector(handleDeleteButtonAction:) forControlEvents:UIControlEventTouchUpInside];
 
 
    
    
    
    
    return cell;
    
}

//删除按钮的实现
- (void)handleDeleteButtonAction:(UIButton *)sender
{
    XLMyWordTableViewCell *cell = (XLMyWordTableViewCell *)sender.superview.superview;
    XLWordManager *_manager = [XLWordManager sharedInstance];
    _manager.type = tableNameOfMyWord;
    
    [_manager deleteWordsInfoWithNumber:cell.civilianLabel.text];
    
     self.wordArray = [_manager wordsList];
    [self.myWordTableView reloadData];
    
}



- (void)dealloc
{
    [_myWordTableView release];
    [_wordArray release];
    [super dealloc];
}










- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
