//
//  HotNetManger.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HotModel.h"
@interface HotNetManger : BaseNetManager
//解析网络
+(id)getHotPassport:(NSInteger)passort kCompletionHandle;
@end
