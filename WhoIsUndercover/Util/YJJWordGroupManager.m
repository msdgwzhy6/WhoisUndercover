//
//  YJJWordGroupManager.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-25.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJWordGroupManager.h"
#import "YJJWordGourpItem.h"


@implementation YJJWordGroupManager

+ (NSMutableArray *)generateADJWordGroup{
    NSMutableArray *adjArray = [NSMutableArray arrayWithArray:@[@"享受的",@"绝望的" , @"深情地" , @"妩媚的" , @"陶醉的" , @"惊奇的" , @"呆滞的" , @"卖萌的" , @"傻笑的" , @"伤心的",@"委屈的",@"狰狞的",@"痛苦的",@"疯狂的",@"兴奋的",@"猥琐的", @"认真的", @"色眯眯的", @"开心的", @"霸气的", @"娘炮的", @"爷们儿的", @"纠结的",@"偷笑的",@"失落的",@"激动的" ]
                                ];
    
    return adjArray;
    
}

+ (NSMutableArray *)genderateActWordGroup{
    
    NSMutableArray *actArray = [NSMutableArray arrayWithArray:@[@"边拔自己的头发边说：爱我，不爱我，爱我....." ,
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
                                                                @"做一个卖萌的表情",@"福利来了，让你左边的人调戏你右边的人",
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
                                                                @"站起来认真地说：我是来自星星的怪兽，嗷呜"]];
    
    
    return actArray;
    
}




@end