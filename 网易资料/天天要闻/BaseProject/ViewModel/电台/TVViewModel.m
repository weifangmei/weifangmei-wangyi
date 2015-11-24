//
//  TVViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TVViewModel.h"

@implementation TVViewModel

/** 行数*/
-(NSInteger)rowNumber{
    return self.dataArr.count;
}
/** 获取cList对象*/
-(TVCListModel *)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}
//获取 tlist
-(NSArray  *)tlistForRow:(NSInteger)row{
    return [self modelForRow:row].tList;
}

/** 主题*/
-(NSString *)cNameForRow:(NSInteger)row{
    return [self modelForRow:row].cname;
    
}
/** 获取cid*/
-(NSString *)cidFoRow:(NSInteger)row{
    return  [self modelForRow:row].cid;
}
/** 获取更多的数据*/
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask =[TVNetManger getRadiocompletionHandle:^(TVModel * model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.cList];

        completionHandle(error);
    }];
}
/** 图片地址*/
-(NSArray *)radioIconURLsForRow:(NSInteger)row
{
    NSMutableArray *arr = [NSMutableArray new];
    for (TVCListTListModel *model in [self tlistForRow:row]) {
        [arr addObject:[NSURL URLWithString:model.radio.imgsrc]];
    }
    return [arr copy];
}
/** 标题*/
-(NSArray *)tNamesForRow:(NSInteger)row{
    NSMutableArray *arr =[NSMutableArray new];
    for (TVCListTListModel *model in [self tlistForRow:row]) {
        [arr addObject:model.radio.tname];
    }
    return [arr copy];
}
/** 描述*/
-(NSArray *)titlesDesForRow:(NSInteger)row{
    NSMutableArray *arr = [NSMutableArray new];
    for (TVCListTListModel *model in [self tlistForRow:row]) {
        [arr addObject:model.radio.title];
    }
    return [arr copy];
}
/** 评论*/
-(NSArray *)commentsCountForRow:(NSInteger)row{
    NSMutableArray  *arr =[NSMutableArray new];
    for (TVCListTListModel *model in [self tlistForRow:row]) {
        NSString *count =[NSString stringWithFormat:@"%.1f万",(model.playCount/10000.0)];
        [arr addObject:count];
    }
    return [arr copy];
}
@end
