//
//  HeadlineModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeadlineModel.h"

@implementation HeadlineModel


+ (NSDictionary *)objectClassInArray{
    return @{@"T1348647853363":[HeadlineTArrModel class],
             @"T1348648517839":[HeadlineTArrModel class],
             @"T1348649079062":[HeadlineTArrModel class],
             @"T1348649580692":[HeadlineTArrModel class],
             @"T1444270454635":[HeadlineTArrModel class]};
}
/** ,
 @"T1348648517839":[HeadlineTArrModel class],
 @"T1348649079062":[HeadlineTArrModel class],
 @"T1348649580692":[HeadlineTArrModel class],
 @"T1444270454635":[HeadlineTArrModel class]*/
@end
@implementation HeadlineTArrModel

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [HeadlineAdsModel class], @"imgextra" : [HeadLineImgextraModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"templateA":@"template"};
}
@end


@implementation HeadlineAdsModel


@end


@implementation HeadLineImgextraModel


@end


