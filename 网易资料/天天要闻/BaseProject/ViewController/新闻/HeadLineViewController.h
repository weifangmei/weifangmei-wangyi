//
//  HeadLineViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadlineNetManger.h"
@interface HeadLineViewController : UIViewController
-(instancetype)initWithType:(HeadlineType)type name:(NSString *)name;
-(WFMNavigationController *)naviInitWithType:(HeadlineType)type name:(NSString *)name;
@property(nonatomic)HeadlineType type;

@property (nonatomic,strong)NSString *titleName;

@end
