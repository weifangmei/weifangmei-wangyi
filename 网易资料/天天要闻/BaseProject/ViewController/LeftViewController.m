//
//  LeftViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LeftViewController.h"
#import "HotTabBarController.h"
#import "HeadlineNetManger.h"
#import "HeadLineViewController.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *itemNames;
@end

@implementation LeftViewController

-(NSArray *)itemNames{
    return @[@"首页",@"头条",@"娱乐",@"体育",@"科技",@"漫画"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.tableView.backgroundColor =[UIColor clearColor];  
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource =self;
        _tableView.tableFooterView =[UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
        /** 去掉分割线*/
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.itemNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.font =[UIFont systemFontOfSize:20];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.backgroundColor =[UIColor clearColor];
    cell.textLabel.textColor =[UIColor blackColor];
    cell.contentView.backgroundColor =[UIColor clearColor];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];  
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[HotTabBarController standardTabInstance] animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[[HeadLineViewController alloc]naviInitWithType:HeadlineTypeTouTiao name:@"头条"]  animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
    
        case 2:
          [self.sideMenuViewController setContentViewController:[[HeadLineViewController alloc]naviInitWithType:HeadlineTypeYuLe name:@"娱乐"]  animated:YES];
              [self.sideMenuViewController hideMenuViewController];
            break;
        
        case 3:
            [self.sideMenuViewController setContentViewController:[[HeadLineViewController alloc]naviInitWithType:HeadlineTypeTiYu name:@"体育"] animated:YES];
              [self.sideMenuViewController hideMenuViewController];
            break;
        
        case 4:
            [self.sideMenuViewController setContentViewController:[[HeadLineViewController alloc]naviInitWithType:HeadlineTypeKeJi name:@"科技"] animated:YES];
              [self.sideMenuViewController hideMenuViewController];
           break;
        case 5:
            [self.sideMenuViewController setContentViewController:[[HeadLineViewController alloc]naviInitWithType:HeadlineTypeManHua name:@"漫画"] animated:YES];
              [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
  
    
    

}
@end
