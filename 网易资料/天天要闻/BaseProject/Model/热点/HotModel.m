//
//  HotModel.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel
+(NSDictionary *)objectClassInArray{
    return @{@"recomment":[HotRecommentModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"recomment":@"推荐"};
}
@end

@implementation HotRecommentModel

+(NSDictionary *)objectClassInArray{
    return @{@"imgnewextra":[HotRecommentImgnewextraModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end
@implementation HotRecommentImgnewextraModel



@end