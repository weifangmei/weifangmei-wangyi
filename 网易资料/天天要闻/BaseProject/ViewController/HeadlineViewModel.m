//
//  HeadlineViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeadlineViewModel.h"

@implementation HeadlineViewModel
-(instancetype)initWithType:(HeadlineType)type{
    if (self =[super init]) {
        _type  = type;
    }
    return self;
}
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 获取数据模型*/
-(HeadlineTArrModel *)modelForRow:(NSInteger)row{
      return self.dataArr[row];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[HeadlineNetManger getType:_type page:_page completionHandle:^(HeadlineModel * model, NSError *error) {
        if (_page == 0) {
            [self.dataArr removeAllObjects];
        }
        switch (_type) {
            case HeadlineTypeKeJi:
                [self.dataArr addObjectsFromArray:model.T1348649580692];
                break;
            case HeadlineTypeYuLe:
                [self.dataArr addObjectsFromArray:model.T1348648517839];
                break;
            case HeadlineTypeManHua:
                [self.dataArr addObjectsFromArray:model.T1444270454635];
                break;
            case HeadlineTypeTouTiao:
                [self.dataArr addObjectsFromArray:model.T1348647853363];
                break;
            case HeadlineTypeTiYu:
                [self.dataArr addObjectsFromArray:model.T1348649079062];
                break;
            default:
                break;
        }
        completionHandle(error);
    }];
   
    
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _page = 0;
    
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    if (_type == HeadlineTypeTouTiao) {
        _page += 140;
        [self getDataFromNetCompleteHandle:completionHandle];
    }
     _page += 20;
    [self getDataFromNetCompleteHandle:completionHandle];

}

-(NSString *)digestForRow:(NSInteger)row{
   
    return [self modelForRow:row].digest;
}

-(NSString *)titleForRow:(NSInteger)row{
    
    return  [self modelForRow:row].title;
}
-(NSURL *)iconForRow:(NSInteger)row{
    return  [NSURL URLWithString:[self modelForRow:row].imgsrc];
}
//数组
-(NSArray *)headAdsForRow:(NSInteger)row
{
    return [self modelForRow:row].ads;
}

-(NSArray *)headURLsForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray new];
    for (HeadlineAdsModel *model in [self headAdsForRow:row]) {
        [arr addObject:model.imgsrc];
    }
    return [arr copy];
}
-(NSArray *)headTitlesForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray new];
    for (HeadlineAdsModel *model in [self headAdsForRow:row]) {
        [arr addObject:model.title];
    }
    return [arr copy];
}
/** 是否有头部视图*/
-(BOOL)containsIconForRow:(NSInteger)row{
    return [self modelForRow:row].hasHead ;
}
-(NSURL *)dizhiURLForRow:(NSInteger)row{
    
    return [NSURL URLWithString:[self modelForRow:row].url_3w];

}
@end
