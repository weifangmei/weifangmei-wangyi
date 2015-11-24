//
//  TVNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TVNetManger.h"

@implementation TVNetManger
+(id)getRadiocompletionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path =@"http://c.3g.163.com/nc/topicset/ios/radio/index.html";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([TVModel objectWithKeyValues:responseObj],error);
    }];
}
@end
