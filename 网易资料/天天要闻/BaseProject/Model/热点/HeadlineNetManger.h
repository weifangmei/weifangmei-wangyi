//
//  HeadlineNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//


#import "BaseNetManager.h"
#import "HeadlineModel.h"
typedef NS_ENUM(NSUInteger,HeadlineType) {
   HeadlineTypeTouTiao,//头条
    HeadlineTypeYuLe,//娱乐
    HeadlineTypeTiYu,//体育
    HeadlineTypeKeJi,//科技
    HeadlineTypeManHua,//漫画
    
};
@interface HeadlineNetManger :BaseNetManager
+(id)getType:(HeadlineType)type page:(NSInteger)page kCompletionHandle;

//解析网络
+(id)getHeadlinePage:(NSInteger)page kCompletionHandle;
@end
