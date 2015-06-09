//
//  YJJRootViewController.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-19.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJRootViewController.h"
#import "YJJDetaViewController.h"
#import "YJJTextView.h"
#import "XLVictoryViewController.h"
#import "UIView+GetBackgroundImage.h"
#import "UIImage+BlurImage.h"
#import <AVFoundation/AVFoundation.h>


@interface YJJRootViewController ()
{
    YJJDetaViewController *detaVC;
}

@property (nonatomic,retain)UIScrollView *ADJScrollView;

@property (nonatomic,retain)UIScrollView *ActScrollView;

@property (nonatomic,assign)BOOL isDefault;//判断惩罚词条是默认还是我的收藏

@property (nonatomic,retain)NSMutableArray *getGainArray;

//@property (retain,nonatomic) AVAudioPlayer *laohujiMusic;

@end

@implementation YJJRootViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.ADJArray = @[@"享受的" , @"绝望的" , @"深情地" , @"妩媚的" , @"陶醉的" , @"惊奇的" , @"呆滞的" , @"卖萌的" , @"傻笑的" , @"伤心的",@"委屈的",@"狰狞的",@"痛苦的",@"疯狂的",@"兴奋的",@"猥琐的", @"认真的", @"色眯眯的", @"开心的", @"霸气的", @"娘炮的", @"爷们儿的", @"纠结的",@"偷笑的",@"失落的",@"激动的",@"享受的" , @"绝望的" , @"深情地" , @"妩媚的" , @"陶醉的" , @"惊奇的" , @"呆滞的" , @"卖萌的" , @"傻笑的" , @"伤心的",@"委屈的",@"狰狞的",@"痛苦的",@"疯狂的",@"兴奋的",@"猥琐的", @"认真的", @"色眯眯的", @"开心的", @"霸气的", @"娘炮的", @"爷们儿的", @"纠结的",@"偷笑的",@"失落的",@"激动的"];
       
        
        self.ActArray = @[@"边拔自己的头发边说：爱我，不爱我，爱我....." ,
                          @"回眸：你本来就很美" ,
                          @"抱着左手边第二位异性的大腿唱情歌" ,
                          @"用舌头舔自己的胳膊肘" ,
                          @"帮每个人捶背，直到满意" ,
                          @"手捏耳垂，做二十个下蹲" ,
                          @"蹲在凳子上做便秘状，边吃东西，20秒" ,
                          @"模仿企鹅走路30秒" ,
                          @"站在凳子上表演大猩猩捶胸咆哮10秒" ,
                          @"跳钢管舞（将身边的人或者物当做钢管）",
                          @"摸自己的胸部30秒",
                          @"吃掉被人给你的任何东西，并说：太好吃了",
                          @"脱下鞋子，抠脚趾",
                          @"走性感撩人的猫步20秒",
                          @"趴在地上学青蛙往前跳5下",
                          @"跳新疆舞30秒，保证一直在左右扭动脖子",
                          @"学机器人介绍自己",
                          @"做鬼脸，让所有人都笑",
                          @"躺着摆pose说：饭在床上，我在锅里",
                          @"闻咯吱窝，并作出对应的表情",
                          @"大声说：凤姐，我不能失去你啊",
                          @"对窗外大喊：我好空虚、好寂寞、好冷啊",
                          @"表演便秘，经过一番挣扎终于成功释放",
                          @"向右边第一位异性抛媚眼，直到对方被电到",
                          @"模仿母乳喂养",
                          @"在厕所里唱歌，让大家都能听到",
                          @"在地上打滚，学泼妇撒泼",
                          @"大声说：对不起，我是人妖",
                          @"学刘欢唱好汉歌",
                          @"摆芙蓉姐姐的S造型",
                          @"立定跳10次",
                          @"翻白眼翻到看不见眼珠",
                          @"把右边第一个异性横抱起来：今晚你归我了！",
                          @"背对着大家，抚摸自己的PP15秒",
                          @"重温大话西游的经典对白，直到大家满意",
                          @"跳芭蕾舞",
                          @"用绵羊音唱两只老虎",
                          @"对右边的第二个异性说：师太，从了老衲吧",
                          @"大喊：爸比，我要喝奶奶",
                          @"唱忐忑",
                          @"躺在地上装死20秒，无论如何不许动",
                          @"望着离你最远的异性为其唱首情歌",
                          @"用手纸当围巾，模仿许文强",
                          @"含一口说话，直到所有人都听清",
                          @"闻左边第一个异性的脚",
                          @"唱青藏高原最后一句",
                          @"大声对窗外喊：我是土豪我怕谁",
                          @"抚摸自己的胸部说：唉，太小了，得去隆一下了",
                          @"用屁股扭出一个字",
                          @"做一个卖萌的表情",
                          @"福利来了，让你左边的人调戏你右边的人",
                          @"打电话给你通讯录里第十个人，说：我是大傻瓜",
                          @"哈哈哈！你右边第三个人替你受罚",
                          @"大喊：我是猴子请来的逗比",
                          @"对进房间的第一个人说：需要特殊服务吗",
                          @"大喊：求包养",
                          @"给QQ好友第一位发：我爱你",
                          @"给妈妈打电话说我结婚了",
                          @"对一名不知情的异性说，我从来不洗脚",
                          @"妩媚的从自己脚底摸到头顶",
                          @"向男服务员偷偷要卫生巾",
                          @"展示你的内裤选中以为中意的同性表白",
                          @"你要叫在你身边的异性叫一声老公",
                          @"说出你的怪癖",
                          @"横抱一位异性",
                          @"唱手机里地第二首歌",
                          @"拿张纸巾对不知情的异性说:打爷来玩啊",
                          @"对一位异性说：我们结婚吧",
                          @"大喊：我是同性恋，我骄傲",
                          @"你讨厌谁？说出来",
                          @"摸着自己的脸：坏坏的说，又要变猪头了",
                          @"随便找个女生躺在下面，男生在上面做俯卧撑",
                          @"与前任，重现分手一幕",
                          @"坐在一位异性腿上，假装情路唱情歌",
                          @"大喊，我的病有救了",
                          @"将自己的裙子掀起来",
                          @"恭喜你，逃过一劫",
                          @"本局无需接受惩罚",
                          @"跟同性隔着扑克牌接吻十秒",
                          @"扒着窗户向外大喊：放我出去",
                          @"与现场一位异性表演求婚",
                          @"大声说出你喜欢谁",
                          @"右手拉左耳，左手拉右耳，从桌子下面过去",
                          @"说出一个最不能说的秘密",
                          @"说出你穿了几件衣服",
                          @"娇羞的说：我是人妖",
                          @"对你爱的人，输出我爱你",
                          @"和一位异性牵手跑出去大喊，我们在一起了",
                          @"亲你暗恋的人",
                          @"自己抱着自己的大腿猛亲",
                          @"给手机主人一个热吻",
                          @"学凤姐说：这都不是我想要的",
                          @"抱着一位异性深蹲5下",
                          @"和墙深情拥吻30秒",
                          @"展示自己最性感的动作",
                          @"用屁股写字：我爱你",
                          @"贱贱的周围人说，我是坏人",
                          @"发信息的给异性说：我是猪",
                          @"大声说：我是蛇精病，我怕谁",
                          @"站起来认真地说：我是来自星星的怪兽，嗷呜",
                @"边拔自己的头发边说：爱我，不爱我，爱我....." ,
                              @"回眸：你本来就很美" ,
                              @"抱着左手边第二位异性的大腿唱情歌" ,
                              @"用舌头舔自己的胳膊肘" ,
                              @"帮每个人捶背，直到满意" ,
                              @"手捏耳垂，做二十个下蹲" ,
                              @"蹲在凳子上做便秘状，边吃东西，20秒" ,
                              @"模仿企鹅走路30秒" ,
                              @"站在凳子上表演大猩猩捶胸咆哮10秒" ,
                              @"跳钢管舞（将身边的人或者物当做钢管）",
                          @"摸自己的胸部30秒",
                          @"吃掉被人给你的任何东西，并说：太好吃了",
                          @"脱下鞋子，抠脚趾",
                          @"走性感撩人的猫步20秒",
                          @"趴在地上学青蛙往前跳5下",
                          @"跳新疆舞30秒，保证一直在左右扭动脖子",
                          @"学机器人介绍自己",
                          @"做鬼脸，让所有人都笑",
                          @"躺着摆pose说：饭在床上，我在锅里",
                          @"闻咯吱窝，并作出对应的表情",
                          @"大声说：凤姐，我不能失去你啊",
                          @"对窗外大喊：我好空虚、好寂寞、好冷啊",
                          @"表演便秘，经过一番挣扎终于成功释放",
                          @"向右边第一位异性抛媚眼，直到对方被电到",
                          @"模仿母乳喂养",
                          @"在厕所里唱歌，让大家都能听到",
                          @"在地上打滚，学泼妇撒泼",
                          @"大声说：对不起，我是人妖",
                          @"学刘欢唱好汉歌",
                          @"摆芙蓉姐姐的S造型",
                          @"立定跳10次",
                          @"翻白眼翻到看不见眼珠",
                          @"把右边第一个异性横抱起来：今晚你归我了！",
                          @"背对着大家，抚摸自己的PP15秒",
                          @"重温大话西游的经典对白，直到大家满意",
                          @"跳芭蕾舞",
                          @"用绵羊音唱两只老虎",
                          @"对右边的第二个异性说：师太，从了老衲吧",
                          @"大喊：爸比，我要喝奶奶",
                          @"唱忐忑",
                          @"躺在地上装死20秒，无论如何不许动",
                          @"望着离你最远的异性为其唱首情歌",
                          @"用手纸当围巾，模仿许文强",
                          @"含一口说话，直到所有人都听清",
                          @"闻左边第一个异性的脚",
                          @"唱青藏高原最后一句",
                          @"大声对窗外喊：我是土豪我怕谁",
                          @"抚摸自己的胸部说：唉，太小了，得去隆一下了",
                          @"用屁股扭出一个字",
                          @"做一个卖萌的表情",
                          @"福利来了，让你左边的人调戏你右边的人",
                          @"打电话给你通讯录里第十个人，说：我是大傻瓜",
                          @"哈哈哈！你右边第三个人替你受罚",
                          @"大喊：我是猴子请来的逗比",
                          @"对进房间的第一个人说：需要特殊服务吗",
                          @"大喊：求包养",
                          @"给QQ好友第一位发：我爱你",
                          @"给妈妈打电话说我结婚了",
                          @"对一名不知情的异性说，我从来不洗脚",
                          @"妩媚的从自己脚底摸到头顶",
                          @"向男服务员偷偷要卫生巾",
                          @"展示你的内裤选中以为中意的同性表白",
                          @"你要叫在你身边的异性叫一声老公",
                          @"说出你的怪癖",
                          @"横抱一位异性",
                          @"唱手机里地第二首歌",
                          @"拿张纸巾对不知情的异性说:打爷来玩啊",
                          @"对一位异性说：我们结婚吧",
                          @"大喊：我是同性恋，我骄傲",
                          @"你讨厌谁？说出来",
                          @"摸着自己的脸：坏坏的说，又要变猪头了",
                          @"随便找个女生躺在下面，男生在上面做俯卧撑",
                          @"与前任，重现分手一幕",
                          @"坐在一位异性腿上，假装情路唱情歌",
                          @"大喊，我的病有救了",
                          @"将自己的裙子掀起来",
                          @"恭喜你，逃过一劫",
                          @"本局无需接受惩罚",
                          @"跟同性隔着扑克牌接吻十秒",
                          @"扒着窗户向外大喊：放我出去",
                          @"与现场一位异性表演求婚",
                          @"大声说出你喜欢谁",
                          @"右手拉左耳，左手拉右耳，从桌子下面过去",
                          @"说出一个最不能说的秘密",
                          @"说出你穿了几件衣服",
                          @"娇羞的说：我是人妖",
                          @"对你爱的人，输出我爱你",
                          @"和一位异性牵手跑出去大喊，我们在一起了",
                          @"亲你暗恋的人",
                          @"自己抱着自己的大腿猛亲",
                          @"给手机主人一个热吻",
                          @"学凤姐说：这都不是我想要的",
                          @"抱着一位异性深蹲5下",
                          @"和墙深情拥吻30秒",
                          @"展示自己最性感的动作",
                          @"用屁股写字：我爱你",
                          @"贱贱的周围人说，我是坏人",
                          @"发信息的给异性说：我是猪",
                          @"大声说：我是蛇精病，我怕谁",
                          @"站起来认真地说：我是来自星星的怪兽，嗷呜"];


        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    imageView1.image = [UIImage imageNamed:@"bg__3.png"];
    imageView1.userInteractionEnabled = YES;
    [self.view addSubview:imageView1];
    [imageView1 release];
    
    
    //滚动框视图
    UIImageView *rollView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 310, 320)];
    rollView.image = [UIImage imageNamed:@"滚动框.png"];
    [imageView1 addSubview:rollView];
    [rollView release];
    
    //格条
    UIImageView *getiaoView = [[UIImageView alloc]initWithFrame:CGRectMake(12, 322, 296, 45)];
    getiaoView.image = [UIImage imageNamed:@"格条"];
    [imageView1 addSubview:getiaoView];
    [getiaoView release];
    
    
    
    //下边框
    UIImageView *underView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 355, 320, 213)];
    underView.image = [UIImage imageNamed:@"下边框.png"];
    underView.userInteractionEnabled = YES;
    [imageView1 addSubview:underView];
    [underView release];
    
    //形容词标签背景
    UIImageView *labelBackView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 220, 50)];
    labelBackView.image = [UIImage imageNamed:@"标签背景3.png"];
    labelBackView.userInteractionEnabled = YES;
    
    
    //形容词滚动条
    self.belowView = [[[UIView alloc]initWithFrame:CGRectMake(50, 114, 220, 50)]autorelease];
    [_belowView addSubview:labelBackView];
    [rollView addSubview:self.belowView];
    [labelBackView release];//
    
    self.ADJScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0 , 0 , 220 , 50)]autorelease];
    _ADJScrollView.contentSize = CGSizeMake(120, 600);
    _ADJScrollView.tag = 123;
    _ADJScrollView.showsHorizontalScrollIndicator = NO;
    _ADJScrollView.delegate = self;
    _ADJScrollView.pagingEnabled = YES;
    [self.belowView addSubview:_ADJScrollView];
 //   [_ADJScrollView release];
    
    for (int i = 0;  i < self.ADJArray.count ; i ++) {
        UILabel *ADJLable = [[UILabel alloc]initWithFrame:CGRectMake( 0 , i *50, 220, 50)];
        ADJLable.text = [self.ADJArray objectAtIndex:i];
        ADJLable.tag = 800+i;
        ADJLable.textAlignment = NSTextAlignmentCenter;
        [_ADJScrollView addSubview:ADJLable];
        [ADJLable release];
  }
    
    
    //动作次背景标签
    UIImageView *backView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 220, 100)];
    backView.image = [UIImage imageNamed:@"标签背景3.png"];
    backView.userInteractionEnabled = YES;
    
//动作词组滚动条
    self.secondView = [[[UIView alloc]initWithFrame:CGRectMake(50, 174, 220, 100)]autorelease];
    self.secondView.backgroundColor  = [UIColor whiteColor];
    [self.secondView addSubview:backView];
    [backView release];

    [rollView addSubview:self.secondView];
   // [_secondView release];
    
    self.ActScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0 , 0 , 220 , 100)]autorelease];
    _ActScrollView.contentSize = CGSizeMake(120, 600);
    _ActScrollView.tag = 124;
    _ActScrollView.showsHorizontalScrollIndicator = NO;
    _ActScrollView.delegate = self;
    _ActScrollView.pagingEnabled = YES;
    [self.secondView addSubview:_ActScrollView];
   // [_ActScrollView release];
    
       for (int i = 0;  i < self.ActArray.count  ; i ++) {
        UILabel *ActLable = [[UILabel alloc]initWithFrame:CGRectMake( 0 , i *100, 220, 100)];
        ActLable.text = [self.ActArray objectAtIndex:i];
        ActLable.textColor = [UIColor blackColor];
        ActLable.numberOfLines = 0;
        ActLable.textAlignment = NSTextAlignmentCenter;
        ActLable.adjustsFontSizeToFitWidth = YES;
        [_ActScrollView addSubview:ActLable];
        [ActLable release];
    }

    
       //惩罚按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(250, 320, 60 , 132);
    [button setImage:[UIImage imageNamed:@"点我啊.png"] forState:UIControlStateNormal];
    button.tag = 150;
    [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
 //默认按钮 Default
    UIButton *defultButton = [UIButton buttonWithType:UIButtonTypeCustom];
    defultButton.frame = CGRectMake(50, 370, 80, 80);
    defultButton.tag = 151;
    [defultButton setImage:[UIImage imageNamed:@"默认2.png"] forState:UIControlStateNormal];
    [defultButton addTarget:self action:@selector(handleDefultButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:defultButton];
    self.isDefault = YES;//默认选中默认按钮
    
//我的收藏按钮
    UIButton *collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    collectButton.frame = CGRectMake(150, 370, 80, 80);
    collectButton.tag = 153;
    [collectButton setImage:[UIImage imageNamed:@"收藏1"] forState:UIControlStateNormal];
    [collectButton addTarget:self action:@selector(handleCollectButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectButton];
  
    
    //返回按钮
    UIButton *returnBurtton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnBurtton.frame = CGRectMake(20, 480,42, 52);
    [returnBurtton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [returnBurtton setImage:[UIImage imageNamed:@"返回2.png"] forState:UIControlStateHighlighted];

    [returnBurtton addTarget:self action:@selector(handleReturnButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBurtton];
    
    //寻找惩罚按钮
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeCustom];
    findButton.frame = CGRectMake(90, 480, 120, 50);
    [findButton setImage:[UIImage imageNamed:@"寻找1"] forState:UIControlStateNormal ];
    [findButton setImage:[UIImage imageNamed:@"寻找2"] forState:UIControlStateHighlighted];
    [findButton addTarget:self action:@selector(handleFindButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findButton];
    
  
    
    //进入文字界面
    UIButton *markButton = [UIButton buttonWithType:UIButtonTypeCustom];
    markButton.frame = CGRectMake(255, 480, 42, 52);
    [markButton setImage:[UIImage imageNamed:@"问号1"] forState:UIControlStateNormal];
    [markButton setImage:[UIImage imageNamed:@"问号2"] forState:UIControlStateHighlighted];
    [markButton addTarget:self action:@selector(handleMarkButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:markButton];
    
    self.getGainArray = [[NSMutableArray alloc]initWithArray:self.gainArray];
    
}

//重写gainArray的get方法，读取文件中的数组
- (NSMutableArray *)gainArray{
    //完整存储
    NSArray *_paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
   // NSLog(@"沙盒路径文件 = %@" , _paths);
    //存储路径
    NSString *doucumentPath = [_paths lastObject];
    NSString *arrayPath = [doucumentPath  stringByAppendingPathComponent:@"gainArray.plist"];
    //判断文件是否存在
  //  if (_gainArray == nil) {
        //使用文件管理类NSFileManager来判定指定的文件路径下的文件是否存在
        NSFileManager *_fileManager = [NSFileManager defaultManager];
        BOOL result = [_fileManager fileExistsAtPath:arrayPath];
        //如果存在则解档文件返回可变数组对象，否则创建数组对象
        if (result) {
            _gainArray = [[[NSMutableArray arrayWithContentsOfFile:arrayPath] retain]autorelease];
        } else {
            _gainArray = [[[NSMutableArray alloc] init]autorelease];
        }
   // }
//return _gainArray;
    
    return _gainArray;
    
}




#pragma mark -- 实现button方法

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//滚动惩罚词条的方法
- (void)handleButtonAction:(UIButton *)sender{
    
    NSMutableArray *gainArray = self.getGainArray;
    
    if (self.isDefault) {
        [self.ActScrollView removeFromSuperview];
        self.ActScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0 , 0 , 220 , 100)]autorelease];
        _ActScrollView.contentSize = CGSizeMake(120, 600);
        _ActScrollView.tag = 124;
        _ActScrollView.showsHorizontalScrollIndicator = NO;
        _ActScrollView.delegate = self;
        _ActScrollView.pagingEnabled = YES;
        [self.secondView addSubview:_ActScrollView];
       // [_ActScrollView release];

        for (int i = 0;  i < self.ActArray.count  ; i ++) {
            UILabel *ActLable = [[UILabel alloc]initWithFrame:CGRectMake( 0 , i *100, 220, 100)];
            ActLable.text = [self.ActArray objectAtIndex:i];
            ActLable.textColor = [UIColor blackColor];
            ActLable.numberOfLines = 0;
            ActLable.textAlignment = NSTextAlignmentCenter;
            ActLable.adjustsFontSizeToFitWidth = YES;
            [_ActScrollView addSubview:ActLable];
            [ActLable release];
        }
        
        
        
    }else {
        [self.ActScrollView removeFromSuperview];
        self.ActScrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0 , 0 , 220 , 100)]autorelease];
        _ActScrollView.contentSize = CGSizeMake(120, 600*gainArray.count);
        _ActScrollView.tag = 124;
        _ActScrollView.showsHorizontalScrollIndicator = NO;
        _ActScrollView.delegate = self;
        _ActScrollView.pagingEnabled = YES;
        [self.secondView addSubview:_ActScrollView];
      //  [_ActScrollView release];
        
        for (int i = 0;  i < gainArray.count  ; i ++) {
            UILabel *ActLable = [[UILabel alloc]initWithFrame:CGRectMake( 0 , i *100, 220, 100)];
            ActLable.text = [gainArray objectAtIndex:i];
            NSLog(@"%@",ActLable.text);
            ActLable.textColor = [UIColor blackColor];
            ActLable.numberOfLines = 0;
            ActLable.textAlignment = NSTextAlignmentCenter;
            ActLable.adjustsFontSizeToFitWidth = YES;
            [_ActScrollView addSubview:ActLable];
            [ActLable release];
        }
        
    }
    



    

    
    
    UIButton *button = (UIButton *) [self.view viewWithTag:150];
    UITapGestureRecognizer *tempTapGesture = [button.gestureRecognizers lastObject];
    tempTapGesture.enabled = YES;
    [sender setImage:[UIImage imageNamed:@"点我.png"] forState:UIControlStateNormal];
    //延迟执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.6 * NSEC_PER_SEC)),dispatch_get_main_queue(),^{
        tempTapGesture.enabled = NO;
        [sender setImage:[UIImage imageNamed:@"点我啊.png"]forState:UIControlStateNormal];
    });
    
        UIScrollView *adjScrollView = (UIScrollView *) [self.view viewWithTag:123];
    UIScrollView *actScrollView = (UIScrollView *) [self.view viewWithTag:124];
    adjScrollView.contentOffset = CGPointMake(0, 0);
    
    NSInteger isAdd = 1;
    
    NSInteger temp = 2,temp2 = 2;
    
    
    for (int  i = 0; temp % 50 != 0; i++) {
        temp = arc4random() % 1000;
    }
    
        if (self.isDefault) {
            temp2 = arc4random() % (self.ActArray.count/2);

        } else {
        temp2 = arc4random() % gainArray.count ;
            isAdd = 0;
        }
    temp2 = temp2 * 100;
    
    CGPoint _newOffset2 = CGPointMake(0, temp2 + 9000 * isAdd);
    
    CGPoint _newOffset = CGPointMake(0, temp + 1000);
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    adjScrollView.contentOffset = _newOffset;
    actScrollView.contentOffset = _newOffset2;
 
    
    [UIView commitAnimations];

    
}


//响应默认按钮
- (void)handleDefultButtonAction:(UIButton *)sender{
    //当点击默认按钮的时候，其他两个按钮都显示未被点击的状态
    
    self.isDefault = YES;
    
      UIButton *button2 = (UIButton *) [self.view viewWithTag:153];

    [button2 setImage:[UIImage imageNamed:@"收藏1"] forState:UIControlStateNormal];
    
    
    [sender setImage:[UIImage imageNamed:@"默认2.png"] forState:UIControlStateNormal];
    
}
//观察者相应方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if ( [keyPath isEqualToString:@"count"] && ([[change objectForKey:@"new"] intValue] == 1 )) {
        
        self.getGainArray = self.gainArray;
        
        if (self.getGainArray.count == 0 ) {
            self.isDefault = YES;
            UIButton *button2 = (UIButton *) [self.view viewWithTag:153];
            [button2 setImage:[UIImage imageNamed:@"默认1"] forState:UIControlStateNormal];
            UIButton *defultButton = (UIButton *) [self.view viewWithTag:151];
            [defultButton setImage:[UIImage imageNamed:@"收藏2"] forState:UIControlStateNormal];
        }
        
        
    }
}

//响应我的收藏词条按钮
- (void)handleCollectButtonAction:(UIButton *)sender{
    
    UIButton *defultButton = (UIButton *) [self.view viewWithTag:151];

    NSInteger number = self.getGainArray.count;
    
    if (number == 0) {
        
        UILabel *alterLable =[[UILabel alloc]initWithFrame:CGRectMake(50, 320, 220, 30)];
        alterLable.backgroundColor = [UIColor blackColor];
        alterLable.font = [UIFont systemFontOfSize:15];
        alterLable.text = @"还没有收藏哦！赶紧收藏吧！";
        alterLable.textAlignment = NSTextAlignmentCenter;
        alterLable.textColor = [UIColor whiteColor];
        [self.view addSubview:alterLable];
        [alterLable release];
        
        [UIView animateWithDuration:1.5 animations:^{
            alterLable.alpha = 0;
        }];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.6 * NSEC_PER_SEC)),dispatch_get_main_queue(),^{

            [alterLable removeFromSuperview];
            
        });

        
        
        
        [sender setImage:[UIImage imageNamed:@"收藏1.png"] forState:UIControlStateNormal];
        [defultButton setImage:[UIImage imageNamed:@"默认2.png"] forState:UIControlStateNormal];
        
        
    } else{
    
       [sender setImage:[UIImage imageNamed:@"收藏2.png"] forState:UIControlStateNormal];
    [defultButton setImage:[UIImage imageNamed:@"默认1.png"] forState:UIControlStateNormal];
    
    self.isDefault = NO;
    }
    
    
}

//点击返回按钮，回到上个页面
- (void)handleReturnButtonAction:(UIButton *)sender{
   
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//点击寻找惩罚按钮，进去下个界面
- (void)handleFindButtonAction:(UIButton *)sender{
    
    
    
    YJJDetaViewController *detaVC1 = [[YJJDetaViewController alloc]init];

    detaVC1.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    detaVC.count = @"0";
    
    
    [detaVC1 addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:nil];
    

        [self presentViewController:detaVC1 animated:YES completion:nil];

 
      [detaVC1 release];
    
}


- (void)handleMarkButtonAction:(UIButton *)sender{
    

  
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

    
    
    
//    UIView *blurBackView = [[UIView alloc]initWithFrame:self.view.bounds];
//    blurBackView.backgroundColor = [UIColor blackColor];
//       blurBackView.alpha = 0.9f;
//     [self.view addSubview:blurBackView];
//    blurBackView.tag = 156;
    
    YJJTextView *textView = [[YJJTextView alloc]initWithFrame:self.view.bounds];
    textView.tag = 157;
    textView.alpha = 0;
    [self.view addSubview:textView];
    
    [UIView animateWithDuration:0.5 animations:^{
        textView.alpha = 1;
    }];
    
    [textView release];
   
   // dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UITapGestureRecognizer *tempTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
        [self.view  addGestureRecognizer:tempTapGesture];
    
 
        [tempTapGesture release];

 //   });
 
}

- (void)handleTapGesture:(UIGestureRecognizer *)sender{
    
    UIImageView *view = (UIImageView *) [self.view viewWithTag:156];
    UIImageView *view2 = (UIImageView *) [self.view viewWithTag:157];
    
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 0;
        view2.alpha = 0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

    [view2 removeFromSuperview];
    [view removeFromSuperview];
    });
  
}










- (void)dealloc{


    [_ActArray release];
    [_ADJArray release];
    [_belowView release];
    [_secondView release];
   // [_gainArray release];
    [_ADJScrollView release];
    [_ActScrollView release];
    
    [super dealloc];
}



@end
