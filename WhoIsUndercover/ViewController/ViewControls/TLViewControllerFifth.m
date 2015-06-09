//
//  TLViewControllerFifth.m
//  Project_help
//
//  Created by God、long on 14-6-19.
//  Copyright (c) 2014年 ERDAN. All rights reserved.
//

#import "TLViewControllerFifth.h"

@interface TLViewControllerFifth ()

@end

@implementation TLViewControllerFifth

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
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"帮助3.png"];
    [self.view addSubview:imageView];
    [imageView release];
    

    
    
    
    
    
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor cyanColor];
    self.explain = [[[UILabel alloc]initWithFrame:CGRectMake(40, 40, 240, 70)] autorelease];
//    self.explain.backgroundColor = [UIColor purpleColor];
    self.explain.text = @"找出所有的卧底和白板，平民就胜利了！！";
    self.explain.numberOfLines = 0;
    self.explain.textAlignment = NSTextAlignmentCenter;
    self.explain.font = [UIFont systemFontOfSize:15];
    
    [self.view addSubview:self.explain];

    UIImageView *people1ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(10, 320, 150, 150)] autorelease];
    UIImage *people1Image = [UIImage imageNamed:@"people1"];
    people1ImageView.image = people1Image;
    [self.view addSubview:people1ImageView];
    
    UIImageView *people2ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(160, 320, 150, 150)] autorelease];
    UIImage *people2Image = [UIImage imageNamed:@"people2"];
    people2ImageView.image = people2Image;
    [self.view addSubview:people2ImageView];

    UIImageView *people3ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(50, 170, 120, 120)] autorelease];
    UIImage *people3Image = [UIImage imageNamed:@"people3cry"];
    people3ImageView.image = people3Image;
    [self.view addSubview:people3ImageView];
    
    UIImageView *people4ImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(160, 170, 120, 120)] autorelease];
    UIImage *people4Image = [UIImage imageNamed:@"people4cry"];
    people4ImageView.image = people4Image;
    [self.view addSubview:people4ImageView];

    UIImageView *jianyuImageView = [[[UIImageView alloc]initWithFrame:CGRectMake(30, 120, 260, 200)] autorelease];
    UIImage *jianyuImage = [UIImage imageNamed:@"监狱"];
    jianyuImageView.image = jianyuImage;
    [self.view addSubview:jianyuImageView];

    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"begingame__2.png"] forState:UIControlStateNormal];
    button1.frame = CGRectMake(130, 508, 60, 60);
    [button1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
}

- (void)button1Action:(UIButton *)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc{
    [_explain release];
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
