//
//  RadioCell.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface RadioCell : UITableViewCell
//三张图片
@property (nonatomic,strong)UIButton *btn1;
@property (nonatomic,strong)UIButton *btn2;
@property (nonatomic,strong)UIButton *btn3;


/** 标签*/
@property (nonatomic,strong)UILabel *titleLb1;
@property (nonatomic,strong)UILabel *desLb1;
@property (nonatomic,strong)UILabel *commentLb1;

@property (nonatomic,strong)UILabel *titleLb2;
@property (nonatomic,strong)UILabel *desLb2;
@property (nonatomic,strong)UILabel *commentLb2;


@property (nonatomic,strong)UILabel *titleLb3;
@property (nonatomic,strong)UILabel *desLb3;
@property (nonatomic,strong)UILabel *commentLb3;
@end
