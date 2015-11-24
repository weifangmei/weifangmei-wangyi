//
//  RadioDetailViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RadioDetailViewController.h"
#import "RadioDetailViewModel.h"
#import "RadioDetailCell.h"
@interface RadioDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)RadioDetailViewModel *radioVM;
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation RadioDetailViewController
-(RadioDetailViewModel *)radioVM{
    if (!_radioVM ) {
        _radioVM =[[RadioDetailViewModel alloc]initWithCid:self.cid];
    }
    return _radioVM;
}
-(instancetype)initWithCid:(NSString *)cid{
    if (self =[super init]) {
        self.cid = cid;
    }
    return self;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView registerClass:[RadioDetailCell class] forCellReuseIdentifier:@"DetailCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
      _tableView.tableFooterView =[UIView new];
        _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.radioVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [_tableView reloadData];
                }
                [_tableView.header endRefreshing];
            }];
        }];
        
        }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =self.name;
    
    [self.tableView.header beginRefreshing];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.radioVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RadioDetailCell *cell =[tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    cell.nameLb.text =[self.radioVM tNameForRow:indexPath.row];
    cell.titleLb.text =[self.radioVM titleForRow:indexPath.row];
    cell.commentLb.text =[self.radioVM commentForRow:indexPath.row];
    [cell.btn setBackgroundImageForState:UIControlStateNormal withURL:[self.radioVM imgsrcURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"audio_block_bg"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}


@end
