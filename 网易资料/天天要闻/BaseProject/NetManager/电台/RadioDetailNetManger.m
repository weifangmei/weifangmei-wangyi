//
//  RadioDetailNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RadioDetailNetManger.h"

@implementation RadioDetailNetManger
+(id)getRadioIndex:(NSInteger)index cid:(NSString *)cid completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/topicset/ios/radio/%@/%ld-20.html",cid,index];
    
    return [self GET:path parameters:nil completionHandler:^(RadioDetailModel* responseObj, NSError *error) {
        completionHandle([RadioDetailModel objectWithKeyValues:responseObj],error);
    }];
}
@end
