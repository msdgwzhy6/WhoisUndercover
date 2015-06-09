//
//  TLViewControllerThird.m
//  Project_help
//
//  Created by God、long on 14-6-19.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "TLViewControllerThird.h"
#import "PeopleViewThird.h"
#import "TLViewControllerFourth.h"

@interface TLViewControllerThird ()

@end

@implementation TLViewControllerThird

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
    
  //  self.view.backgroundColor = [UIColor cyanColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"帮助3.png"];
    [self.view addSubview:imageView];
    [imageView release];
    

    //解释的label
    UILabel *explain = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//    explain.backgroundColor = [UIColor purpleColor];
    explain.text = @"大家按顺序发言，描述下自己的关键字，确认谁是卧底和白板";
    explain.numberOfLines = 0;
    explain.textAlignment = NSTextAlignmentCenter;
    explain.font = [UIFont systemFontOfSize:15];

    [self.view addSubview:explain];
    
    
//    //第一个人
//    PeopleViewThird *people1 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)] autorelease];
//    people1.cardDescribe.text = @"1111";
//    people1.people.backgroundColor = [UIColor redColor];
//    people1.alpha = 0;
//    [self.view addSubview:people1];
//    [PeopleViewThird animateWithDuration:1 animations:^{
//    people1.alpha = 1;
//
//    }completion:^(BOOL finished){
//        if (finished) {
//            sleep(3);
//            people1.alpha = 0;
//        }
//    }];//用时4s
//    
//    //第二个人
//    PeopleViewThird *people2 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
//    people2.cardDescribe.text = @"2222";
//    people2.people.backgroundColor = [UIColor orangeColor];
//    people2.alpha = 0;
//    [self.view addSubview:people2];
//    [PeopleViewThird animateWithDuration:1 animations:^{
//        [PeopleViewThird setAnimationDelay:4];
//        people2.alpha = 1;
//        
//    }completion:^(BOOL finished){
//        if (finished) {
//            sleep(3);
//            people2.alpha = 0;
//        }
//    }];//用时8s
//    
//    //第三个人
//    PeopleViewThird *people3 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
//    people3.cardDescribe.text = @"3333";
//    people3.people.backgroundColor = [UIColor yellowColor];
//    people3.alpha = 0;
//    [self.view addSubview:people3];
//    [PeopleViewThird animateWithDuration:1 animations:^{
//        [PeopleViewThird setAnimationDelay:8];
//        people3.alpha = 1;
//    }completion:^(BOOL finished){
//        if (finished) {
//            sleep(3);
//            people3.alpha = 0;
//
//        }
//    }];//用时12s
//
//    
//    //第四个人
//    PeopleViewThird *people4 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
//    people4.cardDescribe.text = @"4444";
//    people4.people.backgroundColor = [UIColor blackColor];
//    people4.alpha = 0;
//    [self.view addSubview:people4];
//    [PeopleViewThird animateWithDuration:1 animations:^{
////        [PeopleViewThird setAnimationDelay:12];
//        people4.alpha = 1; //用时16s
//    }completion:^(BOOL finished){
//        if (finished) {
//            UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//            button1.frame = CGRectMake(20, 530, 20, 20);
//            button1.backgroundColor = [UIColor greenColor];
//            [self.view addSubview:button1];
//            
//            UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//            button2.frame = CGRectMake(280, 530, 20, 20);
//            button2.backgroundColor = [UIColor greenColor];
//            [button2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
//            [self.view addSubview:button2];
//        }
//        
//    }];
    
}

- (void)animation{
    //第一个人
    PeopleViewThird *people1 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)] autorelease];
    UIImage *image1 = [UIImage imageNamed:@"cardDescribe1"];
    people1.cardDescribe.image = image1;
    UIImage *people1Image = [UIImage imageNamed:@"people1"];
    people1.peopleImageView.image = people1Image;
    people1.alpha = 0;
    [self.view addSubview:people1];
    [PeopleViewThird animateWithDuration:1 animations:^{
        people1.alpha = 1;
        
    }completion:^(BOOL finished){
        if (finished) {
            sleep(3);
            people1.alpha = 0;
        }
    }];//用时4s
    
    //第二个人
    PeopleViewThird *people2 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
    UIImage *image2 = [UIImage imageNamed:@"cardDescribe2"];
    people2.cardDescribe.image = image2;
    UIImage *people2Image = [UIImage imageNamed:@"people2"];
    people2.peopleImageView.image = people2Image;
    people2.alpha = 0;
    [self.view addSubview:people2];
    [PeopleViewThird animateWithDuration:1 animations:^{
        [PeopleViewThird setAnimationDelay:4];
        people2.alpha = 1;
        
    }completion:^(BOOL finished){
        if (finished) {
            sleep(3);
            people2.alpha = 0;
        }
    }];//用时8s
    
    //第三个人
    PeopleViewThird *people3 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
    UIImage *image3 = [UIImage imageNamed:@"cardDescribe3"];
    people3.cardDescribe.image = image3;
    UIImage *people3Image = [UIImage imageNamed:@"people3"];
    people3.peopleImageView.image = people3Image;
    people3.alpha = 0;
    [self.view addSubview:people3];
    [PeopleViewThird animateWithDuration:1 animations:^{
        [PeopleViewThird setAnimationDelay:8];
        people3.alpha = 1;
    }completion:^(BOOL finished){
        if (finished) {
            sleep(3);
            people3.alpha = 0;
        }
    }];//用时12s
    
    
    //第四个人
    PeopleViewThird *people4 = [[[PeopleViewThird alloc]initWithFrame:CGRectMake(0, 0, 320, 568)]autorelease];
    UIImage *image4 = [UIImage imageNamed:@"cardDescribe4"];
    people4.cardDescribe.image = image4;
    UIImage *people4Image = [UIImage imageNamed:@"people4"];
    people4.peopleImageView.image = people4Image;
    people4.alpha = 0;
    [self.view addSubview:people4];
    [PeopleViewThird animateWithDuration:1 animations:^{
    [PeopleViewThird setAnimationDelay:12];
        people4.alpha = 1; //用时16s
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

//模态推出第四个视图
- (void)button2Action:(UIButton *)sender{
    TLViewControllerFourth *fourthVC = [[[TLViewControllerFourth alloc]init] autorelease];
    [self.navigationController pushViewController:fourthVC animated:YES];
   // [fourthVC animation];
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
