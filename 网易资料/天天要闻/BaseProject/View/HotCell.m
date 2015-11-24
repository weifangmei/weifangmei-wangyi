//
//  HeadListCell.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotCell.h"

@implementation HotCell
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

-(UILabel *)longTitleLb{
    if (_longTitleLb == nil) {
        _longTitleLb = [[UILabel alloc] init];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor lightGrayColor];
        _longTitleLb.numberOfLines = 0;
        [self.contentView addSubview:_longTitleLb];
        [_longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
            make.leftMargin.rightMargin.mas_equalTo(self.titleLb);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _longTitleLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
