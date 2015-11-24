//
//  TVModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TVModel.h"

@implementation TVModel
+(NSDictionary *)objectClassInArray{
    return @{@"cList":[TVCListModel class]};
}
@end
@implementation TVCListModel
+(NSDictionary *)objectClassInArray{
    return @{@"tList":[TVCListTListModel class]};
}

@end

@implementation TVCListTListModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"template1":@"template"};
}


@end
@implementation TVCListTListRadioModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"url3w":@"url_3w",@"tAG":@"TAG", @"tAGS":@"TAGS",@"template1":@"template"};
}
@end