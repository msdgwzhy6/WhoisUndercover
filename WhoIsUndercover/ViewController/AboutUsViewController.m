//
//  AboutUsViewController.m
//  WhoIsUndercover
//
//  Created by God、long on 14-7-4.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@property (nonatomic,retain)UIScrollView *scrollViewOfRule;//youxiguize

@property (nonatomic,retain)UIImageView *aboutUsView;

@property (nonatomic,retain)UIDynamicAnimator *animator;

@property (nonatomic,assign)NSInteger number;

@end

@implementation AboutUsViewController

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
    
    NSString *_path1 = [[NSBundle mainBundle]pathForResource:@"rulebg__1" ofType:@"png"];
    UIImage *_image1 = [[UIImage alloc]initWithContentsOfFile:_path1];
    UIImageView *_imageView1 = [[UIImageView alloc]initWithImage:_image1];
    _imageView1.frame = self.view.bounds;
    [self.view addSubview:_imageView1];
    [_image1 release];
    [_imageView1 release];
    
    self.scrollViewOfRule = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, 320, 350)]autorelease];
    _scrollViewOfRule.contentSize = CGSizeMake(0, 568);
    
    NSString *_path = [[NSBundle mainBundle]pathForResource:@"gamerule__1" ofType:@"png"];
    UIImage *_image = [[UIImage alloc]initWithContentsOfFile:_path];
    UIImageView *_imageView = [[UIImageView alloc]initWithImage:_image];
    _imageView.frame = self.view.bounds;
    [_scrollViewOfRule addSubview:_imageView];
    [_image release];
    [_imageView release];
    
    [self.view addSubview:_scrollViewOfRule];
  //  [_scrollViewOfRule release];
    
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(250, 515, 50,50);
    [backButton setImage:[UIImage imageNamed:@"fanhui__2.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"fanhuied__2.png"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(handleBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    UIButton *aboutUsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aboutUsButton.frame = CGRectMake(20, 100, 60,40);
    aboutUsButton.tag = 120;
    [aboutUsButton setImage:[UIImage imageNamed:@"aboutus__2.png"] forState:UIControlStateNormal];
    [aboutUsButton setImage:[UIImage imageNamed:@"aboutused__2.png"] forState:UIControlStateHighlighted];
    [aboutUsButton addTarget:self action:@selector(handleAboutUsAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aboutUsButton];
    

    
  
    

    self.number = 0;
    
    
    
    
    
    
}



- (void)handleAboutUsAction:(UIButton *)sender
{
    sender.enabled = NO;
    self.number = 0;
    NSString *path = [[NSBundle mainBundle]pathForResource:@"aboutus__4" ofType:@".png"];
    UIImage *_image = [[UIImage alloc]initWithContentsOfFile:path];
    
    
    self.aboutUsView = [[[UIImageView alloc]initWithImage:_image]autorelease];
    _aboutUsView.frame = CGRectMake(50, 0, 250, 200);
    [self.view addSubview:_aboutUsView];
    [_image release];
   // [_aboutUsView release];
    
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];

    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[_aboutUsView]];
    
    [gravity setAction:^{
        self.number++;
        if (_number == 40) {
            UIAttachmentBehavior *attach = [[UIAttachmentBehavior alloc]initWithItem:_aboutUsView attachedToAnchor:CGPointMake(160, 130)];
            attach.length = 120;
            attach.damping = 20;
            attach.frequency = 10;
            [self.animator addBehavior:attach];
            [attach release];
            
            
        }
        
    }];
    
    [self.animator addBehavior:gravity];
    
    //[_animator release];
    [gravity release];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGesture];
    [tapGesture release];
    
    
    
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    UIButton *button = (UIButton *)[self.view viewWithTag:120];
    button.enabled = YES;
    [self.aboutUsView removeFromSuperview];
    
}

- (void)handleBackButtonAction:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
