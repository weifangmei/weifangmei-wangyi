//
//  VideoViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoViewModel.h"
#import "VideoCell.h"
#import "RadioViewController.h"

@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource >
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)VideoViewModel *videoVM;
@property (nonatomic,strong)UISegmentedControl *segmentControl;
@property (nonatomic,strong)UIScrollView *scrollView;


@end

@implementation VideoViewController
-(VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM =[VideoViewModel new];
    }
    return _videoVM;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[VideoCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
         //头部刷新
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.videoVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            }];
            
        }];
        //脚步刷新
        _tableView.footer =[MJRefreshBackFooter footerWithRefreshingBlock:^{
            [self.videoVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView.footer endRefreshing];
                [_tableView reloadData];
            }];
        }];

    }
    return _tableView;
}
+(WFMNavigationController *)standardVideoNavi{
    static WFMNavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        VideoViewController *vc =[[VideoViewController alloc]init];
        
        navi =[[WFMNavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
//-(UISegmentedControl *)segmentControl{
//  
//    if (!_segmentControl) {
//        _segmentControl =[[UISegmentedControl alloc]initWithItems:@[@"视频",@"电台"]];
//        _segmentControl.frame = CGRectMake(0, 0,200, 30);
//        _segmentControl.selectedSegmentIndex  =0;
//       
//        [self.navigationController.navigationBar.topItem setTitleView:_segmentControl];
//        
//        /** 添加加事件*/
//      
//    }
//    return _segmentControl;
//}
//
////* segment的事件
//-(void)gotoRadio{
//
//    if (self.segmentControl.selectedSegmentIndex == 1) {
//         RadioViewController *vc =[RadioViewController new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    
//}
-(instancetype)init{
    if (self =[super init]) {
        self.title = @"视频";
        [Factory addMenuItemToVC:self];
        self.tabBarItem.image =[UIImage imageNamed:@"find_album_play"];
        self.tabBarItem.selectedImage =[UIImage imageNamed:@"top_navi_bell_normal"];
    
    
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    // self.title =@"视频";
  //  [self.segmentControl addTarget:self action:@selector(gotoRadio) forControlEvents:UIControlEventValueChanged];
 
    
  

    [self.tableView.header beginRefreshing];
  
  
 
}



//几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.videoVM.rowNumber;
}
//每个分区有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLabel.text =[self.videoVM titleForRow:indexPath.section];
    cell.descLabel.text =[self.videoVM descForRow:indexPath.section];
    [cell.iconBtn setBackgroundImageForState:0 withURL:[self.videoVM iconURLForRow:indexPath.section]];
    cell.videoURL =[self.videoVM videoURLForRow:indexPath.section];
    
    return cell;
}
//脚步9个像素
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

@end
