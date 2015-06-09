//
//  TLViewControllerFourth.m
//  Project_help
//
//  Created by God、long on 14-6-19.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "TLViewControllerFourth.h"
#import "TLViewControllerFifth.h"

@interface TLViewControllerFourth ()

@end

@implementation TLViewControllerFourth

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
   // self.view.backgroundColor = [UIColor cyanColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"帮助3.png"];
    [self.view addSubview:imageView];
    [imageView release];
    

    
    //解释的label
    self.explain = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//    self.explain.backgroundColor = [UIColor purpleColor];
    self.explain.text = @"发完言后，大家同一时间指出自己认为谁是卧底谁是白板";
    self.explain.numberOfLines = 0;
    self.explain.textAlignment = NSTextAlignmentCenter;
    self.explain.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.explain];
    
    self.underCover = [[[UIImageView alloc]initWithFrame:CGRectMake(50, 150, 200, 200)] autorelease];
    UIImage *underCoverImage = [UIImage imageNamed:@"people4"];
    self.underCover.image = underCoverImage;
//    self.underCover.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.underCover];
    
    self.hand1 = [[[UIImageView alloc]initWithFrame:CGRectMake(320, 350, 80, 80)] autorelease];
    UIImage *hand1Image = [UIImage imageNamed:@"hand1"];
    self.hand1.image = hand1Image;
//    self.hand1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.hand1];
    
    self.hand2 = [[[UIImageView alloc]initWithFrame:CGRectMake(320, 450, 80, 80)] autorelease];
    UIImage *hand2Image = [UIImage imageNamed:@"hand2"];
    self.hand2.image = hand2Image;
//    self.hand2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.hand2];

    self.hand3 = [[[UIImageView alloc]initWithFrame:CGRectMake(190, 568, 80, 80)] autorelease];
    UIImage *hand3Image = [UIImage imageNamed:@"hand3"];
    self.hand3.image = hand3Image;
    [self.view addSubview:self.hand3];

    
    
    [UIView animateWithDuration:1 animations:^{
        [UIView setAnimationDelay:0.5];
        self.hand1.frame = CGRectMake(250, 320, 80, 80);
        self.hand2.frame = CGRectMake(250, 400, 80, 80);
        self.hand3.frame = CGRectMake(170, 500, 80, 80);
        
    }completion:^(BOOL finished){
        if (finished) {
            
            self.underCover.alpha = 0;
            UIImageView *underCoverBox = [[[UIImageView alloc]initWithFrame:CGRectMake(50, 370, 150, 100)] autorelease];
            UIImage *underCoverBoxImage = [UIImage imageNamed:@"underCoverBox"];
            underCoverBox.image = underCoverBoxImage;
            [self.view addSubview:underCoverBox];
            UIImageView *underCover1ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(50, 150, 200, 200)] autorelease];
            UIImage *underCover1Image = [UIImage imageNamed:@"underCover"];
            underCover1ImageView.image = underCover1Image;
            [self.view addSubview:underCover1ImageView];
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


//模态推出第五个视图
- (void)button2Action:(UIButton *)sender{
    
    TLViewControllerFifth *fifthVC = [[[TLViewControllerFifth alloc]init] autorelease];
    [self.navigationController pushViewController:fifthVC animated:YES];
    
}

-(void)dealloc
{

    [_explain release];
    [_underCover release];
    [_hand1 release];
    [_hand2 release];
    [_hand3 release];
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
