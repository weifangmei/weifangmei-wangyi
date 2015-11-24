//
//  HotListCell.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotListCell.h"

@implementation HotListCell
-(TRImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV = [[TRImageView alloc] init];
        //内容模式:保持比例,填充满
        //_iconIV.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(80, 80));
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _iconIV;
}

-(UILabel *)titleLb{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(12);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            
        }];
    }
    return _titleLb;
}
-(UILabel *)sourceLb{
    if (_sourceLb == nil) {
        _sourceLb =[[UILabel alloc]init];
        _sourceLb.font =[UIFont systemFontOfSize:15];
        _sourceLb.textColor =[UIColor lightGrayColor];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
        }];
      
    }
    return _sourceLb;
}
-(FUIButton *)btn{
    if (_btn== nil) {
        _btn =[FUIButton buttonWithType:0];
        [_btn setBackgroundImage:[UIImage imageNamed:@"channel_edit_delete"] forState:0];
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _btn;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
