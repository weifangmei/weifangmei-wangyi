//
//  radioDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "radioDetailViewModel.h"

@implementation RadioDetailViewModel
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
-(instancetype)initWithCid:(NSString *)cid{
    if (self =[super init]) {
        _cid =cid;
    }return self;
}
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
     _index = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[RadioDetailNetManger getRadioIndex:_index cid:_cid completionHandle:^(RadioDetailModel * model, NSError *error) {
        if (_index == 0) {
            [self.dataArr removeAllObjects];
        }
         [self.dataArr addObjectsFromArray:model.tList];
            completionHandle(error);
    }];
}

/** 获取对象tlist*/
-(RadioDetailListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
/** 描述title*/
-(NSString *)titleForRow:(NSInteger)row{
    _cid =[self modelForRow:row].cid;
    return [self modelForRow:row].radio.title;
}
/** tName题目*/
-(NSString *)tNameForRow:(NSInteger)row{
    return [self modelForRow:row].radio.tname;
}
/** 评论*/
-(NSString *)commentForRow:(NSInteger)row{
    return [NSString stringWithFormat:@"%.1f万",[self modelForRow:row].playCount / 10000.0];
}
/** 图片*/
-(NSURL *)imgsrcURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].radio.imgsrc];
}
@end
