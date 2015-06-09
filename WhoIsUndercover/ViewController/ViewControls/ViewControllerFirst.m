//
//  ViewControllerFirst.m
//  Project_help
//
//  Created by TL on 14-6-22.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "ViewControllerFirst.h"
#import "ViewControllerSecond.h"

@interface ViewControllerFirst ()

@end

@implementation ViewControllerFirst

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
    
  //  self.view.backgroundColor = [UIColor blueColor];
    
   // self.view.backgroundColor = [UIColor cyanColor];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"帮助4.png"];
    [self.view addSubview:imageView];
    [imageView release];
    

    
    
    UIImageView *peopleNumber = [[UIImageView alloc]initWithFrame:CGRectMake(0, 130, 320, 180)];
    UIImage *peopleNumberImage = [UIImage imageNamed:@"setPersons.png"];
    peopleNumber.image = peopleNumberImage;
    [self.view addSubview:peopleNumber];
    [peopleNumber release];
    
    
    
    
    
    
    //说明文字1
    UILabel *lable1 = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//    lable1.backgroundColor = [UIColor yellowColor];
    lable1.text = @"选择一类大家感兴趣的关键字";
    lable1.textAlignment = NSTextAlignmentCenter;
    lable1.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:lable1];
    lable1.alpha = 1;
    
    [UILabel animateWithDuration:0 animations:^{
        [UILabel setAnimationDelay:9];
        lable1.alpha = 0;
    }completion:^(BOOL finished){
        if (finished) {
            //说明文字2
            UILabel *lable2 = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//            lable2.backgroundColor = [UIColor purpleColor];
            lable2.text = @"确定游戏玩家人数";
            lable2.textAlignment = NSTextAlignmentCenter;
            lable2.font = [UIFont systemFontOfSize:15];
            [self.view addSubview:lable2];
            
        }
    }];
    
    
    
    //scene出现4s
    UIImageView *sceneImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 110)]autorelease];
    UIImage *sceneImage = [UIImage imageNamed:@"slideps__2.png"];
    sceneImageView.image = sceneImage;
    [self.view addSubview:sceneImageView];
    
    [UIView animateWithDuration:2 animations:^{
        [UIView setAnimationDelay:1];
        sceneImageView.frame = CGRectMake(0, 150, self.view.bounds.size.width, 110);
    }completion:^(BOOL finished1){
        if (finished1) {
            //小手出现5s
            UIImageView *handImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(40, 35, 60, 60)] autorelease];
            UIImage *handImage = [UIImage imageNamed:@"hand副本"];
            handImageView.image = handImage;
            [sceneImageView addSubview:handImageView];
            [UIView animateWithDuration:4 animations:^{
                handImageView.frame = CGRectMake(240, 35, 60, 60);
                
            }completion:^(BOOL finished2){
                if (finished2) {
                    [UIView beginAnimations:nil context:nil];
                    [UIView setAnimationDuration:0.5];
                    sceneImageView.frame = CGRectMake(0, -100, self.view.bounds.size.width, 80);
                    [UIView commitAnimations];
                }
            }];
        }
    }];
    
    
    
    
    //第一个人出现1s
    UIImageView *people1ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(40, 300, 100, 100)]autorelease];
    UIImage *people1Image = [UIImage imageNamed:@"people1"];
    people1ImageView.image = people1Image;
    //    UIView *people1 = [[[UIView alloc]initWithFrame:CGRectMake(20, 400, 50, 100)] autorelease];
    //    people1.backgroundColor = [UIColor redColor];
    people1ImageView.alpha = 0;
    [self.view addSubview:people1ImageView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:8];
    people1ImageView.alpha = 1;
    [UIView commitAnimations];//(共10s)
    
    //第二个人出现1s
    UIImageView *people2ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(180, 300, 100, 100)]autorelease];
    UIImage *people2Image = [UIImage imageNamed:@"people2"];
    people2ImageView.image = people2Image;
    
    //    UIView *people2 = [[[UIView alloc]initWithFrame:CGRectMake(180, 280, 100, 100)] autorelease];
    //    people2.backgroundColor = [UIColor redColor];
    people2ImageView.alpha = 0;
    [self.view addSubview:people2ImageView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:9];
    people2ImageView.alpha = 1;
    [UIView commitAnimations];//(共11s)
    
    //第三个人出现1s
    UIImageView *people3ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(40, 400, 100, 100)] autorelease];
    UIImage *people3Image = [UIImage imageNamed:@"people3"];
    people3ImageView.image = people3Image;
    people3ImageView.alpha = 0;
    [self.view addSubview:people3ImageView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:10];
    people3ImageView.alpha = 1;
    [UIView commitAnimations];//(共12s)
    
    //第四个人出现1s
    UIImageView *people4ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(180, 400, 100, 100)] autorelease];
    UIImage *people4Image = [UIImage imageNamed:@"people4.png"];
    people4ImageView.image = people4Image;
    
    //    UIView *people4 = [[[UIView alloc]initWithFrame:CGRectMake(250, 400, 50, 100)] autorelease];
    //    people4.backgroundColor = [UIColor redColor];
    people4ImageView.alpha = 0;
    [self.view addSubview:people4ImageView];
    
    [UIView animateWithDuration:1 animations:^{
        [UIView setAnimationDelay:11];
        people4ImageView.alpha = 1;//(共13s)
        
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


- (void)button1Action:(UIButton *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


//模态推出第二个视图控制器
- (void)button2Action:(UIButton *)sender{
    ViewControllerSecond *secondVC = [[[ViewControllerSecond alloc]init] autorelease];
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC animation];
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
