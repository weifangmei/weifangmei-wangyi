//
//  TRImageView.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TRImageView.h"

@implementation TRImageView
-(instancetype)init{
    if (self =[super init]) {
        _imageView =[[UIImageView alloc]init];
        [self addSubview:_imageView];
        /** 按比例放大，充满*/
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易剪掉超出自身的区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
