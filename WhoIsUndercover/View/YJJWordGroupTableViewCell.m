//
//  YJJWordGroupTableViewCell.m
//  Who'sUndercover
//
//  Created by 张丽娜 on 14-6-25.
//  Copyright (c) 2014年 God、long. All rights reserved.
//

#import "YJJWordGroupTableViewCell.h"

@implementation YJJWordGroupTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //self.contentView.frame =CGRectMake(0, 100, 320, 40);
        self.numberLabel = [[[UILabel alloc]initWithFrame:CGRectMake(5 , 10 , 30, 30)
                            ]autorelease];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_numberLabel];
       // [_numberLabel release];
        
        self.stringLabel = [[[UILabel alloc]initWithFrame:CGRectMake(40, 5, 180, 40)]autorelease];
        _stringLabel.textAlignment = NSTextAlignmentLeft;
        _stringLabel.font = [UIFont systemFontOfSize:12];
        _stringLabel.numberOfLines = 0;
        _stringLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_stringLabel];
       // [_stringLabel release];
        
        self.heartButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _heartButton.frame = CGRectMake(225, 15, 30, 30);
//        [_heartButton setImage:[UIImage imageNamed:@"空心"] forState:UIControlStateNormal];
        [self addSubview:_heartButton];

    }
    return self;
}

- (void)dealloc
{

    [_stringLabel release];
    [_heartButton release];
    [_numberLabel release];
    [super dealloc];
}





- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
