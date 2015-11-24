//
//  RadioCell.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RadioCell.h"


#define kJianXi (kWindowW - 100 *3)/4
@implementation RadioCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

-(UIButton *)btn1{
    if (!_btn1) {
        _btn1 =[UIButton  buttonWithType:0];
        [self.contentView addSubview:_btn1];
        
        [_btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(kJianXi);
        }];
        _btn1.layer.cornerRadius = 50;
        _btn1.layer.masksToBounds = YES;
        
        UIButton *img =[UIButton buttonWithType:0];
        [img setImage:[UIImage imageNamed:@"find_album_play"] forState:0];
       
        [_btn1 addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.center.mas_equalTo(0);
        }];
        
    }
    return _btn1;
}
-(UIButton *)btn2{
    if (!_btn2) {
        _btn2 = [UIButton  buttonWithType:0];
        [self.contentView addSubview:_btn2];
        [_btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.btn1);
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.left.mas_equalTo(self.btn1.mas_right).mas_equalTo(kJianXi);
        }];
        _btn2.layer.cornerRadius = 50;
        _btn2.layer.masksToBounds = YES;
        UIImageView *img =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_btn2 addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.center.mas_equalTo(0);
        }];

    }
    
    return _btn2;
}
-(UIButton *)btn3{
    if (!_btn3) {
        _btn3 =[UIButton  buttonWithType:0];
        [self.contentView addSubview:_btn3];
        [_btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.btn1);
            make.left.mas_equalTo(self.btn2.mas_right).mas_equalTo(kJianXi);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        _btn3.layer.cornerRadius =50;
        _btn3.layer.masksToBounds = YES;
        UIImageView *img =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_btn3 addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.center.mas_equalTo(0);
        }];
    }
    return _btn3;
    
}
-(UILabel *)titleLb1{
    if (!_titleLb1) {
        _titleLb1 =[UILabel new];
        [self.contentView addSubview:_titleLb1];
   
        [_titleLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.btn1.mas_bottom).mas_equalTo(8);
            make.centerX.mas_equalTo(self.btn1);
            
        }];
        
    }
    return _titleLb1;
}
-(UILabel *)titleLb2{
    if (!_titleLb2) {
        _titleLb2 =[UILabel new];
     
       
        [self.contentView addSubview:_titleLb2];
        [_titleLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.btn2);
            make.topMargin.mas_equalTo(self.titleLb1);
        }];
    }
    
    return _titleLb2;
}
-(UILabel *)titleLb3{
    if (!_titleLb3) {
        _titleLb3 =[UILabel new];
        [self.contentView addSubview:_titleLb3];
        [_titleLb3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.titleLb1);
            make.centerX.mas_equalTo(self.btn3);
        }];
    }
    return _titleLb3;
}
-(UILabel *)desLb1{
    if (!_desLb1) {
        _desLb1 =[UILabel new];
        [self.contentView addSubview:_desLb1];
        _desLb1.numberOfLines =2;
        _desLb1.textColor =[UIColor  lightGrayColor];
        _desLb1.font =[UIFont systemFontOfSize:13];
        [_desLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLb1.mas_bottom).mas_equalTo(15);
            make.leftMargin.rightMargin.mas_equalTo(self.btn1);
            
        }];
    }
    return _desLb1;
}
-(UILabel *)desLb2{
    if (!_desLb2) {
        _desLb2 =[UILabel new];
        _desLb2.textColor =[UIColor lightGrayColor];
        _desLb2.font =[UIFont systemFontOfSize:13];
        _desLb2.numberOfLines =2;
        [self.contentView addSubview:_desLb2];
        [_desLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.desLb1.mas_topMargin);
            make.leftMargin.rightMargin.mas_equalTo(self.btn2);
        }];
    }
    return _desLb2;
}
-(UILabel *)desLb3{
    if (!_desLb3) {
        _desLb3 =[UILabel new];
        _desLb3.textColor =[UIColor lightGrayColor];
        _desLb3.font =[UIFont systemFontOfSize:13];
        _desLb3.numberOfLines = 2;
        [self.contentView addSubview:_desLb3];
        [_desLb3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.desLb1.mas_topMargin);
            make.leftMargin.rightMargin.mas_equalTo(self.btn3);
        }];
        
        
    }
    return _desLb3;
}
-(UILabel *)commentLb1{
    if (!_commentLb1) {
        _commentLb1 =[UILabel new];
        _commentLb1.textColor=[UIColor lightGrayColor];
        _commentLb1.font =[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_commentLb1];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_header_audio"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.desLb1.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leftMargin.mas_equalTo(self.btn1.mas_leftMargin);
        }];
        [_commentLb1 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _commentLb1;
}
-(UILabel *)commentLb2{
    if (!_commentLb2) {
        _commentLb2=[UILabel new];
        _commentLb2.textColor =[UIColor lightGrayColor];
        _commentLb2.font =[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_commentLb2];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_header_audio"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.desLb1.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leftMargin.mas_equalTo(self.btn2.mas_leftMargin);
        }];
        [_commentLb2 mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
             make.bottom.mas_equalTo(-10);
        }];
        
    }
    return _commentLb2;
}
-(UILabel *)commentLb3{
    if (!_commentLb3) {
        _commentLb3 =[UILabel new];
        _commentLb3.textColor =[UIColor lightGrayColor];
        _commentLb3.font =[UIFont systemFontOfSize:12];
        [self.contentView addSubview:_commentLb3];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_header_audio"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.desLb3.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.leftMargin.mas_equalTo(self.btn3.mas_leftMargin);
        }];
        [_commentLb3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
            make.bottom.mas_equalTo(-10);
        }];

    }
    return _commentLb3;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
