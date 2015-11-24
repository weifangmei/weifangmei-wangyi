//
//  HeadlineNetManger.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeadlineNetManger.h"

@implementation HeadlineNetManger
+(id)getType:(HeadlineType)type page:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = nil;
    switch (type) {
        case HeadlineTypeTouTiao:
           path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/headline/T1348647853363/%@-140.html",@(page)];
            break;
        case HeadlineTypeYuLe:
            path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348648517839/%@-20.html",@(page)];
            break;
        case HeadlineTypeTiYu:
            path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348649079062/%@-20.html",@(page)];
            break;
        case HeadlineTypeManHua:
            path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1444270454635/%@-20.html",@(page)];
                   break;
        case HeadlineTypeKeJi:
            path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/list/T1348649580692/%@-20.html",@(page)];
            break;
        default:
            break;
    }
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeadlineModel objectWithKeyValues:responseObj],error);
    }];
    
}

//+(id)getHeadlinePage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle{
//    NSString *path =[NSString stringWithFormat:@"http://c.3g.163.com/nc/article/headline/T1348647853363/%ld-140.html",page];
//    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
//        completionHandle([HeadlineModel objectWithKeyValues:responseObj],error);
//    }];
//}
@end
