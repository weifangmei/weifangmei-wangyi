//
//  RadioDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RadioDetailCell.h"

@implementation RadioDetailCell
-(UIButton *)btn{
    if (!_btn ) {
        _btn =[UIButton buttonWithType:0];
        [self.contentView addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.bottom.mas_equalTo(-10);
        }];
        _btn.layer.cornerRadius = 50;
        _btn.layer.masksToBounds = YES;
        
        UIButton *imgBtn = [UIButton buttonWithType:0];
        [imgBtn setImage:[UIImage imageNamed:@"find_album_play"] forState:0];
        
        [_btn addSubview:imgBtn];
        [imgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.center.mas_equalTo(0);
        }];
    }
    return _btn;
}
-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb=[UILabel new];
        _nameLb.font =[UIFont boldSystemFontOfSize:19];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.btn.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(15);
        }];
        
    }
    return _nameLb;
}
-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb =[UILabel new];
        _titleLb.font =[UIFont systemFontOfSize:16];
        _titleLb.textColor =[UIColor lightGrayColor];
        _titleLb.numberOfLines = 2;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(6);
            make.leftMargin.rightMargin.mas_equalTo(self.nameLb);
            
        }];
    }
    return  _titleLb;
}
-(UILabel *)commentLb{
    if (!_commentLb) {
        _commentLb =[UILabel new];
        _commentLb.textColor =[UIColor lightGrayColor];
        _commentLb.font =[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_commentLb];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-5);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(10);
        
        }];
        UIImageView *img =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_header_audio"]];
        [self.contentView addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_commentLb.mas_left).mas_equalTo(-3);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.centerY.mas_equalTo(self.commentLb);
        }];
        
        
    }
    return  _commentLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
