//
//  HotNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotNetManger.h"

@implementation HotNetManger

+(id)getHotPassport:(NSInteger)passort completionHandle:(void (^)(id, NSError *))completionHandle{
   
    NSString *path = [NSString stringWithFormat:@"http://c.3g.163.com/recommend/getSubDocPic?passport=%ld@sina.163.com&devId=CD10DAFD-AB78-4481-81F6-AA7B4AEC0812&size=20&version=5.3.4&spever=false&net=wifi&lat=0.000000&lon=0.000000",passort];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HotModel objectWithKeyValues:responseObj],error);
    }];

}
@end
