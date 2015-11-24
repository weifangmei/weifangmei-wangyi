//
//  TVViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TVModel.h"
#import "TVNetManger.h"
@interface TVViewModel : BaseViewModel
/** 行数*/
@property(nonatomic)NSInteger rowNumber;
@property (nonatomic,strong)NSArray *arr;
/** 主题*/
-(NSString *)cNameForRow:(NSInteger)row;
/** 获取cid*/
-(NSString *)cidFoRow:(NSInteger)row;

/** Radio类的*/
/** 标题*/
-(NSArray *)tNamesForRow:(NSInteger)row;
/** 描述*/
-(NSArray *)titlesDesForRow:(NSInteger)row;
/** 评论次数*/
-(NSArray *)commentsCountForRow:(NSInteger)row;
/** 图片地址*/
- (NSArray *)radioIconURLsForRow:(NSInteger)row;
@end
