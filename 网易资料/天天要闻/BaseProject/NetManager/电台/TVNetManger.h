//
//  TVNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TVModel.h"
@interface TVNetManger : BaseNetManager
//解析网络
+(id)getRadiocompletionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
