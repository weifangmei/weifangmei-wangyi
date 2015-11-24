//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "LeftViewController.h"

#import "HotTabBarController.h"
#import "HotDetailNetManger.h"
#import "HotNetManger.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   

 
    [self initializeWithApplication:application];
    
    self.window.rootViewController=self.sideMenu;
    return YES;
}
-(RESideMenu *)sideMenu{
    if (!_sideMenu) {
    
        _sideMenu =[[RESideMenu alloc]initWithContentViewController:[HotTabBarController standardTabInstance]  leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        /** 设置背景图*/
        _sideMenu.backgroundImage=[UIImage imageNamed:@"side_background"];
        /** 可以出现菜单栏时不显示状态栏*/
        _sideMenu.menuPrefersStatusBarHidden = YES;
        /** 不允许菜单栏可以到了边缘还可以继续*/
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}
-(UIWindow *)window{
    if (!_window) {
        _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}
@end
