//
//  RadioDetailModel.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RadioDetailModel.h"

@implementation RadioDetailModel
+(NSDictionary *)objectClassInArray{
    return @{@"tList":[RadioDetailListModel class]};
}
@end

@implementation RadioDetailListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"templateA":@"template"};
}

@end
@implementation RadioDetailListRadioModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"templateA":@"template",@"url3w":@"url_3w",@"tAG":@"TAG", @"tAGS":@"TAGS"};
}


@end