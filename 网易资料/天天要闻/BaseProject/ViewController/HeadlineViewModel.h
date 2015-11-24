//
//  HeadlineViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HeadlineNetManger.h"
@interface HeadlineViewModel : BaseViewModel
/** 行数*/
@property(nonatomic)NSInteger rowNumber;
/** 类型*/
@property(nonatomic)HeadlineType type;
-(instancetype)initWithType:(HeadlineType)type;

@property(nonatomic)NSInteger page;
//描述
-(NSString *)digestForRow:(NSInteger)row;
//主题
-(NSString *)titleForRow:(NSInteger)row;
//图片
-(NSURL *)iconForRow:(NSInteger)row;
//评论
-(NSString *)replyCountForRow:(NSInteger)row;

-(NSURL *)dizhiURLForRow:(NSInteger)row;
/** 头部视图的个数*/
/** 存放头部视图*/
@property (nonatomic,strong)NSArray *headAds;
/** 头部标题*/

-(NSArray *)headURLsForRow:(NSInteger)row;
/** 头部图片地址*/
-(NSArray *)headTitlesForRow:(NSInteger)row;

/** 是否有头部视图*/
-(BOOL)containsIconForRow:(NSInteger)row;


@end
