//
//  ViewControllerSecond.m
//  Project_help
//
//  Created by TL on 14-6-22.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "ViewControllerSecond.h"
#import "PeopleVeiwSecond.h"
#import "TLViewControllerThird.h"

@interface ViewControllerSecond ()

@end

@implementation ViewControllerSecond

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
    
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"helpbg__2" ofType:@".png"];
//    UIImage *_image = [[UIImage alloc]initWithContentsOfFile:path];
//    UIImageView *_imageView = [[UIImageView alloc]initWithImage:_image];
//    _imageView.frame = self.view.bounds;
//    [self.view addSubview:_imageView];
//    [_image release];
//    [_imageView release];
//    
  //  self.view.backgroundColor = [UIColor cyanColor];

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"帮助1.png"];
    [self.view addSubview:imageView];
    [imageView release];
    

    
    self.explain = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//    self.explain.backgroundColor = [UIColor purpleColor];
    self.explain.text = @"一号玩家点击翻牌";
    self.explain.numberOfLines = 0;
    self.explain.textAlignment = NSTextAlignmentCenter;
    self.explain.font = [UIFont systemFontOfSize:15];

    [self.view addSubview:self.explain];
    
    
}
#pragma mark - tap Gesture Action -
//轻拍手势的方法
- (void)tapGestureAction:(UITapGestureRecognizer *)sender{
    //翻转效果
    [UIView transitionFromView:self.card1 toView:self.card2 duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished){
        if (finished) {
            self.explain.alpha = 0;
            PeopleVeiwSecond *people1 = [[[PeopleVeiwSecond alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
            UIImage *people1Image = [UIImage imageNamed:@"people1"];
            people1.peopleImageView.image = people1Image;
            people1.explainLabel.text = @"记好关键字，并传递给下一个玩家";
            people1.explainLabel.numberOfLines = 0;
            people1.explainLabel.textAlignment = NSTextAlignmentCenter;
            people1.explainLabel.font = [UIFont systemFontOfSize:15];
            people1.cardNameLabel.text = @"草莓";
            people1.cardNameLabel.textAlignment = NSTextAlignmentCenter;
            people1.cardNameLabel.font = [UIFont systemFontOfSize:30];
            people1.alpha = 0;
            [self.view addSubview:people1];
            
            [PeopleVeiwSecond beginAnimations:nil context:nil];
            
            people1.alpha = 1;
            [PeopleVeiwSecond setAnimationDuration:1];
            [PeopleVeiwSecond commitAnimations];
            
            
            PeopleVeiwSecond *people2 = [[[PeopleVeiwSecond alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
            UIImage *people2Image = [UIImage imageNamed:@"people2"];
            
            people2.peopleImageView.image = people2Image;
            people2.explainLabel.text = @"2号玩家翻牌，记好关键字，并传递给下一个玩家";
            people2.explainLabel.numberOfLines = 0;
            people2.explainLabel.textAlignment = NSTextAlignmentCenter;
            people2.explainLabel.font = [UIFont systemFontOfSize:15];
            people2.cardNameLabel.text = @"草莓";
            people2.cardNameLabel.textAlignment = NSTextAlignmentCenter;
            people2.cardNameLabel.font = [UIFont systemFontOfSize:30];
            people2.alpha = 0;
            [self.view addSubview:people2];
            
            
            [PeopleVeiwSecond beginAnimations:nil context:nil];
            [PeopleVeiwSecond setAnimationDelay:4];
            [PeopleVeiwSecond setAnimationDuration:1];
         
            people2.alpha = 1;
            [PeopleVeiwSecond commitAnimations];
            
            
            PeopleVeiwSecond *people3 = [[[PeopleVeiwSecond alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
            UIImage *people3Image = [UIImage imageNamed:@"people3"];
            people3.peopleImageView.image = people3Image;
            people3.explainLabel.text = @"3号玩家翻牌，卧底的关键字和其他的不一样，小心露馅哦";
            people3.explainLabel.numberOfLines = 0;
            people3.explainLabel.textAlignment = NSTextAlignmentCenter;
            people3.explainLabel.font = [UIFont systemFontOfSize:15];
            people3.cardNameLabel.text = @"蓝莓";
            people3.cardNameLabel.textAlignment = NSTextAlignmentCenter;
            people3.cardNameLabel.font = [UIFont systemFontOfSize:30];
            people3.alpha = 0;
            [self.view addSubview:people3];
            [PeopleVeiwSecond beginAnimations:nil context:nil];
            [PeopleVeiwSecond setAnimationDelay:8];
            [PeopleVeiwSecond setAnimationDuration:1];
          
            people2.explainLabel.alpha = 0;
            people3.alpha = 1;
            [PeopleVeiwSecond commitAnimations];
            
            PeopleVeiwSecond *people4 = [[[PeopleVeiwSecond alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
            UIImage *people4Image = [UIImage imageNamed:@"people4"];
            people4.peopleImageView.image = people4Image;
            people4.explainLabel.text = @"4好玩家翻牌，白板没有关键字，要根据小伙伴们的描述才是什么东东哦";
            people4.explainLabel.numberOfLines = 0;
            people4.explainLabel.textAlignment = NSTextAlignmentCenter;
            people4.explainLabel.font = [UIFont systemFontOfSize:15];
            people4.cardNameLabel.text = @"";
            people4.cardNameLabel.textAlignment = NSTextAlignmentCenter;
            people4.cardNameLabel.font = [UIFont systemFontOfSize:30];

            people4.alpha = 0;
            [self.view addSubview:people4];
            
            [PeopleVeiwSecond animateWithDuration:1 animations:^{
                [PeopleVeiwSecond setAnimationDelay:12];
          
                people3.explainLabel.alpha = 0;
                people4.alpha = 1;
            }completion:^(BOOL finished){
                if (finished) {
                    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
                    [button1 setImage:[UIImage imageNamed:@"跳过1"] forState:UIControlStateNormal];
                    button1.frame = CGRectMake(20, 495, 45, 45);
                    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
                    
                    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
                    [button2 setImage:[UIImage imageNamed:@"下一步1"] forState:UIControlStateNormal];
                    button2.frame = CGRectMake(265, 495, 45, 45);
                    [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
                    [self.view addSubview:button1];
                    [self.view addSubview:button2];
                }
            }];
        }
    }];


}

- (void)animation{
    UIView *backCard = [[[UIView alloc]initWithFrame:CGRectMake(50, 150, 220, 300)]autorelease];
    [self.view addSubview:backCard];
    
    
    self.card2 = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 220, 300)]autorelease];
    //self.card2.backgroundColor = [UIColor greenColor];
    UIImageView *card1ImageView2 = [[[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 170, 230)] autorelease];
    UIImage *card1Image2 = [UIImage imageNamed:@"btn_card_back.png"];
    [self.card2 addSubview:card1ImageView2];
    card1ImageView2.image = card1Image2;
    [backCard addSubview:self.card2];

    
    
    
    self.card1 = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 220, 300)]autorelease];
    UIImageView *card1ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 170, 230)] autorelease];
    UIImage *card1Image = [UIImage imageNamed:@"card1"];
    [self.card1 addSubview:card1ImageView];
    card1ImageView.image = card1Image;
    //    self.card1.image = card1Image;
    //    self.card1.backgroundColor = [UIColor redColor];
    [backCard addSubview:self.card1];
    //添加一个轻拍手势
    UITapGestureRecognizer *_tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
    _tapGesture.numberOfTapsRequired = 1;
    [self.card1 addGestureRecognizer:_tapGesture];
    [_tapGesture release];

    
}




- (void)button1Action:(UIButton *)sender{

    [self.navigationController popToRootViewControllerAnimated:YES];
    

}


//推出第三个视图
- (void)button2Action:(UIButton *)sender{
    TLViewControllerThird *thirdVC = [[[TLViewControllerThird alloc]init] autorelease];
    thirdVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.navigationController pushViewController:thirdVC animated:YES];
    [thirdVC animation];
}

- (void)dealloc
{

    [_explain release];
    [_card1 release];
    [_card2 release];
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
