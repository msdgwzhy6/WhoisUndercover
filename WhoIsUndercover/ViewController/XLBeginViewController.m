//
//  XLBeginViewController.m
//  BeginGame
//
//  Created by God、long on 14-6-17.
//  Copyright (c) 2014年 ___许龙___. All rights reserved.
//

#import "XLBeginViewController.h"
#import "XLCollectionCustomCell.h"
#import "XLVictoryViewController.h"
//#import "XLWatchView.h"
#import "XLAlertBView.h"


@interface XLBeginViewController ()
//{
//    UIDynamicAnimator *animator;
//}

@property (nonatomic,retain)UIDynamicAnimator *animator;

@property (nonatomic,retain)NSMutableArray *identityArray;//身份数组

@property (nonatomic,retain)NSString *markOfUndercover;//卧底的号码

@property (nonatomic,retain)UILabel *titleLabel;//用来设置navigationBar上title

@property (nonatomic,retain)XLCollectionCustomCell *cell;//传值cell

@property (nonatomic,assign)NSInteger numberOfFirstPerson;//第几个发言的人的号

@property (nonatomic,retain)NSMutableArray *undercoverArray;//卧底号码的数组

@property (nonatomic,assign)NSInteger number;//tag值的增加

/*
@property (nonatomic,retain)UIButton *headImageButton1;//头像一

@property (nonatomic,retain)UIButton *headImageButton2;

@property (nonatomic,retain)UIButton *headImageButton3;
@property (nonatomic,retain)UIButton *headImageButton4;
@property (nonatomic,retain)UIButton *headImageButton5;
@property (nonatomic,retain)UIButton *headImageButton6;
@property (nonatomic,retain)UIButton *headImageButton7;
@property (nonatomic,retain)UIButton *headImageButton8;
@property (nonatomic,retain)UIButton *headImageButton9;
*/
//@property (nonatomic,assign)BOOL headselectButton;//头像选择开关


@end

@implementation XLBeginViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.identityArray = [NSMutableArray array];
        self.number = 0;
        self.undercoverArray = [NSMutableArray array];
       // self.headselectButton = NO;
       
    }
    return self;
}

- (void)viewDidLoad
{
    

    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    
    //设置背景图片
    
    NSString *_imagePath = [[NSBundle mainBundle]pathForResource:@"bg__5" ofType:@".png"];
    UIImage *_image = [[UIImage alloc] initWithContentsOfFile:_imagePath];
    UIImageView *_imageView = [[UIImageView alloc]initWithImage:_image];
    _imageView.frame = CGRectMake(0, 0, 320, 568);
    [self.view addSubview:_imageView];
    [_imageView release];
    [_image release];
    
    
    

    //设置提醒字体Label
    NSString *imagePathOfNotice = [[NSBundle mainBundle]pathForResource:@"noticeword_bg" ofType:@".png"];
    UIImage *imageOfNotice = [[UIImage alloc]initWithContentsOfFile:imagePathOfNotice];
    UIImageView *imageViewOfNotice = [[UIImageView alloc]initWithImage:imageOfNotice];
    imageViewOfNotice.frame = CGRectMake(0, 60, 320, 30);
    imageViewOfNotice.userInteractionEnabled = YES;
    [self.view addSubview:imageViewOfNotice];
    [imageOfNotice release];
    [imageViewOfNotice release];
    
    self.noticeLabel = [[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 30)]autorelease];
    _noticeLabel.text = @"1号请翻牌";
    _noticeLabel.font = [UIFont systemFontOfSize:13];
    _noticeLabel.textColor = [UIColor yellowColor];
    _noticeLabel.textAlignment = NSTextAlignmentCenter;
    [imageViewOfNotice addSubview:self.noticeLabel];

    
    
    //隐藏电池条的方法
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }

    
    
    //隐藏navigationBar的左视图
  //  self.navigationItem.hidesBackButton = YES;
    
    
    UICollectionViewFlowLayout *_flowLayout = [[[UICollectionViewFlowLayout alloc]init]autorelease];
    //单元格大小
    _flowLayout.itemSize = CGSizeMake(50, 50);
  
    
    //根据不同的人数，分布不同的item的位置
    switch (self.numberGamePersons) {
        case 3:
        {
            //上下间距
            _flowLayout.minimumLineSpacing = 20;
            //左右间距
            _flowLayout.minimumInteritemSpacing = 28.3;
            //边界大小
            _flowLayout.sectionInset = UIEdgeInsetsMake(20 + 64, 28.3, 5, 28.3);

        }
            break;
        case 4:
        {
            //上下间距
            _flowLayout.minimumLineSpacing = 62.5;
            //左右间距
            _flowLayout.minimumInteritemSpacing = 55;
            //边界大小
            _flowLayout.sectionInset = UIEdgeInsetsMake(62.5 + 64, 55, 62.5, 55);
        }
            break;
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        {
            //上下间距
            _flowLayout.minimumLineSpacing = 33.3;
            //左右间距
            _flowLayout.minimumInteritemSpacing = 28.3;
            //边界大小
            _flowLayout.sectionInset = UIEdgeInsetsMake(33.3 + 64, 28.3, 33.3, 28.3);

        }
            break;
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        {
            //上下间距
            _flowLayout.minimumLineSpacing = 20;
            //左右间距
            _flowLayout.minimumInteritemSpacing = 15;
            //边界大小
            _flowLayout.sectionInset = UIEdgeInsetsMake(20 + 64, 15, 5, 15);

        }
            break;
        default:
            break;
    }
    
    
//    //上下间距
//    _flowLayout.minimumLineSpacing = 20;
//    //左右间距
//    _flowLayout.minimumInteritemSpacing = 30;
//    //边界大小
//    _flowLayout.sectionInset = UIEdgeInsetsMake(20, 30, 5, 30);
    _flowLayout.headerReferenceSize = CGSizeMake(10, 10);
    _flowLayout.footerReferenceSize = CGSizeMake(10, 10);
    
    self.collectionView = [[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:_flowLayout]autorelease];
    
    //设置背景色
    self.collectionView.backgroundColor = [UIColor clearColor];
    //设置代理方法
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //注册单元格类型
    
    [self.collectionView registerClass:[XLCollectionCustomCell class]forCellWithReuseIdentifier:identifier];
    
    [self.view addSubview:self.collectionView];
    
    //身份数组存值
    //1. 先加入所有的平民
    for (int i = 0; i < self.numberOfCivilian; i++) {
        [self.identityArray  addObject:@"平民"];
    }
    //2.通过随机数，插入卧底
    switch (self.numberOfUndercover) {
        case 1:
        {
            switch (self.numberOfWhiteBoard) {
                case 0:
                {
                    NSInteger indexOfUndercover = arc4random()%self.numberOfCivilian;
                    [self.identityArray insertObject:@"卧底" atIndex:indexOfUndercover];
                }
                    break;
                case 1:
                {
                    NSInteger indexOfUndercover = arc4random()%self.numberOfCivilian;
                    [self.identityArray insertObject:@"卧底" atIndex:indexOfUndercover];
                    NSInteger indexOfWhiteboard = arc4random()%(self.numberOfCivilian + 1);
                    [self.identityArray insertObject:@"白板" atIndex:indexOfWhiteboard];
 
                }
                    break;

                default:
                    break;
            }
                    }
            break;
        case 2:
        {
            switch (self.numberOfWhiteBoard) {
                case 0:
                {
                    for (int i = 0; i <= 1; i++) {
                        
                        NSInteger indexOfUndercover = arc4random()%(self.numberOfCivilian + i);
                        [self.identityArray insertObject:@"卧底" atIndex:indexOfUndercover];
                    }

                }
                    break;
                case 1:
                {
                    for (int i = 0; i <= 1; i++) {
                        
                        NSInteger indexUndercover = arc4random()%(self.numberOfCivilian + i);
                        [self.identityArray insertObject:@"卧底" atIndex:indexUndercover];
                    }
                    NSInteger indexWhiteboard = arc4random()%(self.numberOfCivilian + 2);
                    [self.identityArray insertObject:@"白板" atIndex:indexWhiteboard];
                    
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
            

        default:
            break;
    }
    
//    
//    for (int i = 0; i < self.identityArray.count; i++) {
//        NSLog(@"%d号 %@",i,[self.identityArray objectAtIndex:i]);
//    }
    
    
    //添加左下角的返回按钮
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(20, 515, 50,50);
    
    [self.backButton setImage:[UIImage imageNamed:@"fanhui__2.png"] forState:UIControlStateNormal];
    [self.backButton setImage:[UIImage imageNamed:@"fanhuied__2.png"] forState:UIControlStateHighlighted];
   // self.backButton.backgroundColor = [UIColor whiteColor];
   // [self.backButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(handleBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    
    
   
}



// 把电池条设为隐藏

- (BOOL)prefersStatusBarHidden
{
    return YES;//隐藏为YES，显示为NO
}

//返回按钮的实现
- (void)handleBackButtonAction:(UIButton *)sender
{
//    XLAlertBView *_alertView1 = (XLAlertBView *)[self.view viewWithTag:210];
//    UIView *collisionView1 = [self.view viewWithTag:211];
//    [collisionView1 removeFromSuperview];
//    [_alertView1 removeFromSuperview];

    sender.enabled = NO;
     UIView *collisionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 350)];
    collisionView.tag = 211;
    [self.view addSubview:collisionView];
    [collisionView release];
    
    XLAlertBView *_alertView = [[XLAlertBView alloc]initWithFrame:CGRectMake(70, 50, 220, 120)];
    _alertView.tag = 210;
 
    
    //旋转一下角度
    _alertView.transform = CGAffineTransformMakeRotation(M_PI_4 / 1.5);
    _alertView.userInteractionEnabled = YES;
       
    _alertView.alertLabel.text = @"确定要结束本轮游戏吗？";
    [_alertView.cancelButton addTarget:self action:@selector(handleCancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_alertView.okButton addTarget:self action:@selector(handleOkButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_alertView.okButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [collisionView addSubview:_alertView];
    
  
   self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:collisionView];

    //给提醒视图添加重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[_alertView]];
    //给提醒视图添加碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[_alertView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [_animator addBehavior:gravity];
    [_animator addBehavior:collision];

    [gravity release];
    [collision release];
    
    [_alertView release];
    
    }
//提醒视图中，返回按钮的实现
- (void)handleCancelButtonAction:(UIButton *)sender
{
    self.backButton.enabled = YES;
    XLAlertBView *_alertView = (XLAlertBView *)[self.view viewWithTag:210];
    UIView *collisionView = [self.view viewWithTag:211];
    [collisionView removeFromSuperview];
    [_alertView removeFromSuperview];
    [_animator release];
}
//提醒视图中，确定按钮的实现
- (void)handleOkButtonAction:(UIButton *)sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}


#pragma mark - UICollectionView DataSource Methods - 


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    //有几个人就有几个item
    return self.numberGamePersons;
}

//单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XLCollectionCustomCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.tag = 101 + indexPath.row;//cell的tag值是从101开始的
    //如果游戏总人数为3.把item移到视图的中间
    if (self.numberGamePersons == 3) {
        
        cell.center = CGPointMake(cell.center.x, self.view.center.y-90);
        
    }

    //给item分配号码
    cell.numberLaber.text = [NSString stringWithFormat:@"%ld号",indexPath.row + 1];
    //cell.imageName = [NSString stringWithFormat:@"spy_superscript_%d",indexPath.row + 1];
    
    NSString *_imagePathOfNumber = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"spy_superscript_%ld",indexPath.row + 1] ofType:@".png"];
    UIImage *_imageOfNumber = [[UIImage alloc] initWithContentsOfFile:_imagePathOfNumber];
    UIImageView *_numberImage = [[UIImageView alloc]initWithImage:_imageOfNumber];
    
     _numberImage.frame = CGRectMake(21, 0, 30, 30);
    
    [cell addSubview:_numberImage];
    [_imageOfNumber release];
    [_numberImage release];

    
    //根据身份数组中的值分别赋值给cell的身份属性identityLaber
    cell.identityLaber.text = [self.identityArray objectAtIndex:indexPath.row];
    cell.identityLaber.hidden = YES;
    //把cell的边框关闭
    cell.backImage.alpha = 0;
    
    //给不同身份的cell赋值不同的词语
    if ([cell.identityLaber.text isEqualToString:@"平民"]) {
        
        cell.wordString = self.wordOfCivilian;//赋值平民词给平民的cell
        
    } else if ([cell.identityLaber.text isEqualToString:@"卧底"]){
        
        cell.wordString = self.wordOfUndercover;//赋值卧底词给卧底的cell
        [self.undercoverArray addObject:cell.numberLaber.text];
       // self.markOfUndercover = cell.numberLaber.text;
        
    } else {
        
        cell.wordString = @"白板";
        
    }
    
    
    //设置全部cell隐藏；
    
    cell.hidden = YES;
    
    
    
    //长按手势
    UILongPressGestureRecognizer *_longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGestureAction:)];
    
   
    //设置长按手势触发方法所需要的时间.
    _longPressGesture.minimumPressDuration = 0.5;
    //给cell添加长按手势
    [cell addGestureRecognizer:_longPressGesture];
    [_longPressGesture release];
    
    //添加一个轻拍手势
    UITapGestureRecognizer *_tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    //给cell添加轻拍手势
    [cell addGestureRecognizer:_tapGesture];
    [_tapGesture release];
    
    
    if (indexPath.row == self.numberGamePersons - 1) {
        [self tapGestureAction:nil];
        
    }
    
    
   //设置单元格的圆角属性
    cell.layer.cornerRadius = 6;
    
    if (indexPath.row == 0) {
        
        self.cell = cell;
        
    }
    
    
    
    
    
    
    return cell;
}

//长按手势的实现
- (void)longPressGestureAction:(UILongPressGestureRecognizer *)sender
{
#pragma text
    //设置手势的state，一到规定的最小时间就会相应这个方法
    if (sender.state == UIGestureRecognizerStateBegan) {
        
    
    
    XLCollectionCustomCell *cell = (XLCollectionCustomCell *)sender.view;
    
    
    cell.numberLaber.hidden = YES;
    cell.identityLaber.hidden = NO;
    if ([cell.identityLaber.text isEqualToString: @"平民"]) {
        self.numberOfCivilian--;
        self.numberGamePersons--;
      
        
    } else if ([cell.identityLaber.text isEqualToString: @"卧底"]){
        self.numberOfUndercover--;
        self.numberGamePersons--;
        
  

    } else if ([cell.identityLaber.text isEqualToString: @"白板"]){
        self.numberOfWhiteBoard--;
        self.numberGamePersons--;
   

    }
    
        
    //判断输赢，以确定是否胜利
    
    if (self.numberGamePersons <= 9) {
        if (self.numberOfCivilian >= 2 && self.numberOfUndercover == 0) {
            //平民胜利
            [self setupVictory:@"平民"];
        
        }else if(self.numberGamePersons == 2 && self.numberOfUndercover == 1){
            //卧底胜利
            [self setupVictory:@"卧底"];
            
        }else if(self.numberGamePersons == 2 && self.numberOfUndercover == 0 && self.numberOfWhiteBoard == 1){
            //白板胜利
            [self setupVictory:@"白板"];
        }
    } else if(self.numberGamePersons > 9){
        if (self.numberOfCivilian >= 2 && self.numberOfUndercover == 0) {
            //平民胜利
            [self setupVictory:@"平民"];
        }else if((self.numberGamePersons == 3 && self.numberOfUndercover == 2) || (self.numberGamePersons == 2 && self.numberOfUndercover == 1)){
            //卧底胜利
            [self setupVictory:@"卧底"];

        }else if(self.numberGamePersons == 2 && self.numberOfUndercover == 0 && self.numberOfWhiteBoard == 1){
            //白板胜利
           [self setupVictory:@"白板"];

        }
    }
    
    
    
    }
    
}

// 胜利后调用的方法
- (void)setupVictory:(NSString *)identity
{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor=[UIColor redColor];

    
    //传值
    XLVictoryViewController *_victoryView = [[XLVictoryViewController alloc]init];
    _victoryView.identityString = identity;
    _victoryView.undercoverArray = self.undercoverArray;
    _victoryView.civilianString = self.wordOfCivilian;
    _victoryView.numberOfGamePerson = self.numberAllOfGamePerson;
    _victoryView.undercoverString = self.wordOfUndercover;
    _victoryView.numberString = self.markOfUndercover;
    _victoryView.view.alpha = 0;

    
    
    [self.navigationController pushViewController:_victoryView animated:NO];
    
 
    [_victoryView release];
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
   
    _victoryView.view.alpha = 1;
    
    
    [UIView commitAnimations];
}


//轻拍手势的实现
- (void)tapGestureAction:(UITapGestureRecognizer *)sender
{
    
    
    
    XLCollectionCustomCell *cell = (XLCollectionCustomCell *)sender.view;
    if (cell != nil) {
        
        self.cell = cell;
       
    }
    
    //调出看牌视图
    
    XLWatchView *_watchView = [[XLWatchView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    //_watchView.backgroundColor = [UIColor grayColor];
    _watchView.tag = 200;
    //给选择头像按钮添加方法
    [_watchView.selectButton addTarget:self action:@selector(handleSelectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //根据布尔值 headselectButton 的真假，来选择按钮是否隐藏

    _watchView.selectButton.hidden = YES;
    
    
    
   // _watchView.delegate = self;
    
    _watchView.wordLabel.text = self.cell.wordString;
    
    [self.view addSubview:_watchView];
    [_watchView release];
    
    
   
    //记住了Button
    UIButton *_rememberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rememberButton.frame = CGRectMake(85, 370 , 150, 100);
   // [_rememberButton setTitle:@"我记住了！" forState:UIControlStateNormal];
    [_rememberButton setImage:[UIImage imageNamed:@"remember_btn.png"] forState:UIControlStateNormal];
    [_rememberButton setImage:[UIImage imageNamed:@"remember_btn_down.png"] forState:UIControlStateHighlighted];
   // [_rememberButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rememberButton addTarget:self action:@selector(handleRememberButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _rememberButton.showsTouchWhenHighlighted = YES;
    [self.view addSubview:_rememberButton];

    _watchView.rememberButton = _rememberButton;
        _rememberButton.hidden = YES;
    
    

    
    
   
   
}

- (void)handleSelectButtonAction:(UIButton *)sender
{
    
//    sender.hidden = YES;
//    self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_imageButton setImage:[UIImage imageNamed:@"headImage_1.png"] forState:UIControlStateNormal];
//    [_imageButton addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    _imageButton.frame = CGRectMake(135, 240, 30, 30);
//    [self.view addSubview:_imageButton];
//    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:_imageButton snapToPoint:CGPointMake(135 , 240 - 100)];
//    [animator addBehavior:snap];
//    [snap release];
    /*
    self.headImageButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headImageButton1 setImage:[UIImage imageNamed:@"headImaged_1.png"] forState:UIControlStateNormal];
    [_headImageButton1 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headImageButton1 setTitle:@"1" forState:UIControlStateNormal];
    _headImageButton1.frame = CGRectMake(135, 240, 30, 30);
    [self.view addSubview:_headImageButton1];
    UISnapBehavior *snap1 = [[UISnapBehavior alloc]initWithItem:_headImageButton1 snapToPoint:CGPointMake(135 - 80 , 230)];
    [animator addBehavior:snap1];
    [snap1 release];
    
    self.headImageButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headImageButton2 setImage:[UIImage imageNamed:@"headImage_2.png"] forState:UIControlStateNormal];
    [_headImageButton2 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headImageButton2 setTitle:@"2" forState:UIControlStateNormal];
    _headImageButton2.frame = CGRectMake(135, 240, 30, 30);
    [self.view addSubview:_headImageButton2];
    UISnapBehavior *snap2 = [[UISnapBehavior alloc]initWithItem:_headImageButton2 snapToPoint:CGPointMake(135 - 40 , 230 - 40)];
    [animator addBehavior:snap2];
    [snap2 release];
    
    self.headImageButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headImageButton3 setImage:[UIImage imageNamed:@"headImaged_3.png"] forState:UIControlStateNormal];
    [_headImageButton3 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headImageButton3 setTitle:@"3" forState:UIControlStateNormal];
    _headImageButton3.frame = CGRectMake(135, 240, 30, 30);
    [self.view addSubview:_headImageButton3];
    UISnapBehavior *snap3 = [[UISnapBehavior alloc]initWithItem:_headImageButton3 snapToPoint:CGPointMake(135 + 20 , 230 - 60)];
    [animator addBehavior:snap3];
    [snap3 release];
    
    self.headImageButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headImageButton4 setImage:[UIImage imageNamed:@"headImage_4.png"] forState:UIControlStateNormal];
    [_headImageButton4 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headImageButton4 setTitle:@"4" forState:UIControlStateNormal];
    _headImageButton4.frame = CGRectMake(135, 240, 30, 30);
    [self.view addSubview:_headImageButton4];
    UISnapBehavior *snap4 = [[UISnapBehavior alloc]initWithItem:_headImageButton4 snapToPoint:CGPointMake(135 + 90 , 230 - 40)];
    [animator addBehavior:snap4];
    [snap4 release];
    
    self.headImageButton5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [_headImageButton5 setImage:[UIImage imageNamed:@"headImage_5.png"] forState:UIControlStateNormal];
    [_headImageButton5 addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headImageButton5 setTitle:@"5" forState:UIControlStateNormal];
    _headImageButton5.frame = CGRectMake(135, 240, 30, 30);
    [self.view addSubview:_headImageButton5];
    UISnapBehavior *snap5 = [[UISnapBehavior alloc]initWithItem:_headImageButton5 snapToPoint:CGPointMake(135 + 130 , 230 )];
    [animator addBehavior:snap5];
    [snap5 release];
    
    
    */
    
    
    
    
}

- (void)handleButtonAction:(UIButton *)sender
{
    
    [_animator removeAllBehaviors];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:sender snapToPoint:CGPointMake(155 , 240)];
    
    [_animator addBehavior:snap];
    
    [snap release];
    
    NSInteger temp = [sender.titleLabel.text integerValue];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"headImage_%ld",(long)temp] ofType:@".png"];
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:path];
    UIImageView *viewImage = [[UIImageView alloc]initWithImage:image];
    viewImage.userInteractionEnabled = YES;
    [self.cell addSubview:viewImage];
    [image release];
    [viewImage release];

    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//    [_imageButton removeFromSuperview];
//    });
    
    
}


//_rememberButton点击方法的实现
- (void)handleRememberButtonAction:(UIButton *)sender
{
    
    //头像的消除
    /*
    [_headImageButton1  removeFromSuperview];
    [_headImageButton2  removeFromSuperview];
    [_headImageButton3  removeFromSuperview];
    [_headImageButton4  removeFromSuperview];
    [_headImageButton5  removeFromSuperview];
    */
    [sender removeFromSuperview];
   // sender.hidden = YES;
    XLWatchView *_watchView = (XLWatchView *)[self.view viewWithTag:200];
       //动画隐藏
//    
//    [UIView beginAnimations:nil context:nil];
//    
//    [UIView setAnimationDuration:10];
//    
//    _watchView.wordView.alpha = 0.2;
//    
//    [UIView commitAnimations];
    
    //把看牌试图从父视图上移除
    [_watchView removeFromSuperview];
    XLCollectionCustomCell *cell = (XLCollectionCustomCell *)[self.view viewWithTag:101 + _number];
    
    cell.hidden = NO;
    
    XLCollectionCustomCell *nextCell = (XLCollectionCustomCell *)[self.view viewWithTag:101 + _number + 1];
    
    self.cell = nextCell;

    
    
    //得到第二个手势，也就是轻拍手势，把他设为NO。
  
    UITapGestureRecognizer *tempTapGesture = [cell.gestureRecognizers lastObject];

    tempTapGesture.enabled = NO;
    
         _number++;
    //判定是否继续调用轻拍
    if (_number < self.numberGamePersons) {
        //更改navigationBar的title
        self.noticeLabel.text = [NSString stringWithFormat:@"传递手机，%ld号请翻牌",_number + 1];
        //继续调用轻拍手势
        [self tapGestureAction:nil];
    } else if(_number == self.numberGamePersons){
        self.numberOfFirstPerson = arc4random()%self.numberGamePersons + 1;
        
        //设置先发言的cell的闪光动画
        
        XLCollectionCustomCell *flashCell = (XLCollectionCustomCell *)[self.view viewWithTag:101 + _numberOfFirstPerson - 1];
        //设置动画开始
        [UIView beginAnimations:nil context:nil];
        //改变view的属性
        
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationRepeatCount:1000];
        
        flashCell.backImage.alpha = 1;
        
        //提交动画
        [UIView  commitAnimations];
        self.noticeLabel.text = [NSString stringWithFormat:@"%ld号玩家先发言，所有人都发言后投票",_numberOfFirstPerson];
      

        
        //一次游戏代码只执行一次
       
            //添加忘词Button
            UIButton *_forgetWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _forgetWordButton.frame = CGRectMake(130, 520, 70, 35);
           // [_forgetWordButton setTitle:@"?忘词" forState:UIControlStateNormal];
            [_forgetWordButton setImage:[UIImage imageNamed:@"forget_btn.png"] forState:UIControlStateNormal];
           // [_forgetWordButton setImage:[UIImage imageNamed:@"forget_btn_down.png"] forState:UIControlStateHighlighted];
            _forgetWordButton.titleLabel.textAlignment = NSTextAlignmentCenter;
            [_forgetWordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_forgetWordButton addTarget:self action:@selector(handleForgetWordButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_forgetWordButton];
        
        
    }
    
    
}

//忘记按钮的实现

- (void)handleForgetWordButtonAction:(UIButton *)sender
{
    
    //把头像选择开关关闭
    
    //self.headselectButton = YES;
    
    
    //点击忘记按钮后，把所有得item得Tap手势恢复功能
    [sender setImage:[UIImage imageNamed:@"forget_btn_down.png"] forState:UIControlStateNormal];
    for (int i = 0; i <= self.numberGamePersons - 1; i++) {
        XLCollectionCustomCell *cell = (XLCollectionCustomCell *)[self.view viewWithTag:101 + i ];
        cell.backImage.alpha = 1;
        UITapGestureRecognizer *tempTapGesture = [cell.gestureRecognizers lastObject];
        tempTapGesture.enabled = YES;
        
        //延迟执行
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [sender setImage:[UIImage imageNamed:@"forget_btn.png"] forState:UIControlStateNormal];

            tempTapGesture.enabled = NO;
          //  [sender setTitle:@"?忘词" forState:UIControlStateNormal];
            cell.backImage.alpha = 0;
            
            XLCollectionCustomCell *flashCell = (XLCollectionCustomCell *)[self.view viewWithTag:101 + _numberOfFirstPerson - 1];
            //设置动画开始
            [UIView beginAnimations:nil context:nil];
            //改变view的属性
            
            [UIView setAnimationDuration:1.0];
            [UIView setAnimationRepeatAutoreverses:YES];
            [UIView setAnimationRepeatCount:1000];
            
            flashCell.backImage.alpha = 1;
            
            //提交动画
            [UIView  commitAnimations];

        });
    }
    
    
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
#pragma mark text
    return 1;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{

    [_collectionView release];
    [_dataArray release];
    [_wordOfCivilian release];
    [_wordOfUndercover release];
    [_identityArray release];
    [_markOfUndercover release];
    [_titleLabel release];
    [_cell release];
    [_undercoverArray release];
    [_backButton release];
    [_animator release];
    [_noticeLabel release];
    [super dealloc];
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
