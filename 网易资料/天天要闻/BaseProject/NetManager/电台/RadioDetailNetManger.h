//
//  RadioDetailNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RadioDetailModel.h"
@interface RadioDetailNetManger : BaseNetManager
+(id)getRadioIndex:(NSInteger)index cid:(NSString *)cid kCompletionHandle;
@end
