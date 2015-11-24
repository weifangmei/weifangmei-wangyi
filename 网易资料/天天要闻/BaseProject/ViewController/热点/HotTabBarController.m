//
//  HotTabBarController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotTabBarController.h"
#import "VideoViewController.h"
#import "RadioViewController.h"
#import "HotViewController.h"

@interface HotTabBarController ()

@end

@implementation HotTabBarController
+(HotTabBarController *)standardTabInstance{
    static HotTabBarController *vc = nil;
    static dispatch_once_t onceTToken;
    dispatch_once(&onceTToken, ^{
        vc =[[HotTabBarController alloc]init];
    });
    return vc;
    
}

//初始化三个子视图
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = NO;
   // [self.tabBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_back_highlighted"]];
   
   // [self.tabBar setSelectionIndicatorImage:[[UIImage imageNamed:@"tabbar_selected_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)]];
    

    
     VideoViewController *videoVC =[[VideoViewController alloc]init];
   
     RadioViewController *radioVC =[[RadioViewController alloc]init];
     HotViewController *hotVC =[[HotViewController alloc]init];
 
 
    WFMNavigationController *videoNavi =[[WFMNavigationController alloc]initWithRootViewController:videoVC];
    WFMNavigationController *radioNavi =[[WFMNavigationController alloc]initWithRootViewController:radioVC];
    WFMNavigationController *hotNavi =[[WFMNavigationController alloc]initWithRootViewController:hotVC];
    //添加导航到控制器中
    self.viewControllers=@[hotNavi,videoNavi,radioNavi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
