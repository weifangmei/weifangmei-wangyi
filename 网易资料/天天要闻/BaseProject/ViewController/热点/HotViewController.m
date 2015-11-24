//
//  HotViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotViewController.h"
#import "HotViewModel.h"
#import "HotCell.h"
#import "HotListCell.h"
#import "HotHtmlViewController.h"

@interface HotViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)HotViewModel *hotVM;
@end

@implementation HotViewController
-(HotViewModel *)hotVM{
    if (!_hotVM) {
        _hotVM =[[HotViewModel alloc]init];
    }
    return _hotVM;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HotCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[HotListCell class] forCellReuseIdentifier:@"listCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.hotVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }
                else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.hotVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }
                else{
                    [_tableView reloadData];
                }
                [_tableView.footer endRefreshing];
            }];
        }];
        
    }
    return _tableView;
}
-(instancetype)init{
    if (self =[super init]) {
        self.title=@"热点";
        [Factory addMenuItemToVC:self];
        self.tabBarItem.image =[UIImage imageNamed:@"find_album_play"];
        self.tabBarItem.selectedImage =[UIImage imageNamed:@"top_navi_bell_normal"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.header beginRefreshing];
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hotVM.rowNumber;
}
-(UIView *)headView{
    UIView *headView =[UIView new];
    [self.view addSubview:headView];

    
    
    
    
    
    
    return headView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HotListCell *cell1 =[tableView dequeueReusableCellWithIdentifier:@"listCell"];
    if (indexPath.row  == 0) {
        
    }
    [cell1.iconIV.imageView setImageWithURL:[self.hotVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"lm_groupbuy_empty"]];
    cell1.btn.hidden = NO;
   
    [cell1.btn bk_addEventHandler:^(id sender) {
#warning 点击出一个提示框
        
    } forControlEvents:UIControlEventTouchUpInside];
    cell1.titleLb.text =[self.hotVM titleForRow:indexPath.row];
    cell1.sourceLb.text =[self.hotVM sourceForRow:indexPath.row];
    return cell1;



}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    HotHtmlViewController *vc = [[HotHtmlViewController alloc]initWithID:[self.hotVM idForRow:indexPath.row]];
   
    [self.navigationController pushViewController:vc animated:YES];
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
