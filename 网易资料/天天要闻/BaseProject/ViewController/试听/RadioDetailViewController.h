//
//  RadioDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadioDetailViewController : UIViewController
-(instancetype)initWithCid:(NSString *)cid;
@property (nonatomic,strong)NSString *cid;
@property (nonatomic,strong)NSString *name;
@end
