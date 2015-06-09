//
//  XLMyWordTableViewCell.m
//  WhoIsUndercover
//
//  Created by God、long on 14-7-1.
//  Copyright (c) 2014年 __许龙__. All rights reserved.
//

#import "XLMyWordTableViewCell.h"

@implementation XLMyWordTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.numberLabel = [[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 20, 30)]autorelease];
     //   _numberLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:_numberLabel];
        [_numberLabel release];
        
        self.civilianLabel = [[[UILabel alloc]initWithFrame:CGRectMake(30, 5, 80, 30)]autorelease];
        _civilianLabel.font = [UIFont systemFontOfSize:12];
    //    _civilianLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:_civilianLabel];
     //   [_civilianLabel release];
        
        self.undercoverLabel = [[[UILabel alloc]initWithFrame:CGRectMake(115, 5, 80, 30)]autorelease];
        _undercoverLabel.font = [UIFont systemFontOfSize:12];
      //  _undercoverLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:_undercoverLabel];
      //  [_civilianLabel release];
        
        self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"edit_delete_btn.png"] forState:UIControlStateNormal];
        _deleteButton.frame = CGRectMake(200, 10, 40, 25);
        [self addSubview:_deleteButton];
        
        
        
        
    }
    return self;
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

-(void)dealloc
{
    [_numberLabel release];
    [_civilianLabel release];
    [_undercoverLabel release];
    [_deleteButton release];
    [super dealloc];
}

@end
