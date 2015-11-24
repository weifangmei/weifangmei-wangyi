//
//  radioDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RadioDetailNetManger.h"
@interface RadioDetailViewModel : BaseViewModel
//行数
@property(nonatomic)NSInteger rowNumber;

//页数
@property(nonatomic)NSInteger index;
//初始化
-(instancetype)initWithCid:(NSString *)cid;

@property (nonatomic,strong)NSString *cid;
/** 题目*/
-(NSString *)tNameForRow:(NSInteger)row;
/** 描述*/
-(NSString *)titleForRow:(NSInteger)row;
/** 评论*/
-(NSString *)commentForRow:(NSInteger)row;
/** 图片地址*/
-(NSURL *)imgsrcURLForRow:(NSInteger)row;
@end
