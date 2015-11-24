//
//  RadioViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "RadioViewController.h"
#import "VideoViewController.h"
#import "TVViewModel.h"
#import "RadioCell.h"
#import "RadioDetailViewController.h"
@interface RadioViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)TVViewModel *tvVM;
@end

@implementation RadioViewController
+(UINavigationController *)standardRadioNavi{
    static WFMNavigationController *navi =nil;
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RadioViewController *vc = [[RadioViewController alloc]init];
        navi=[[WFMNavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
    
}
-(TVViewModel *)tvVM{
    if (!_tvVM) {
        _tvVM =[TVViewModel new];
    }
    return _tvVM;
}

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource =self;
        [_tableView registerClass:[RadioCell class] forCellReuseIdentifier:@"radioCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
       
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.tvVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                     [_tableView reloadData];
                }
               
                [_tableView.header endRefreshing];
            }];

       }];
        
    }
    return  _tableView;
}
-(instancetype)init{
    if (self =[super init]) {
         self.title =@"电台";
        [Factory addMenuItemToVC:self];
        self.tabBarItem.image =[UIImage imageNamed:@"find_album_play"];
        self.tabBarItem.selectedImage =[UIImage imageNamed:@"top_navi_bell_normal"];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tvVM.rowNumber;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
        UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        cell.textLabel.text=[self.tvVM cNameForRow:indexPath.section];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text =@"进入";
       return cell;
    }
    else {
        RadioCell *cell =[tableView dequeueReusableCellWithIdentifier:@"radioCell"];
        //图片
        NSArray *arr = [self.tvVM radioIconURLsForRow:indexPath.section];
        NSArray *images = @[cell.btn1,cell.btn2,cell.btn3];
        [images enumerateObjectsUsingBlock:^(UIButton * _Nonnull  obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj setBackgroundImageForState:UIControlStateNormal withURL:arr[idx] placeholderImage:[UIImage imageNamed:@"audio_block_bg"]];
            
            [obj bk_addEventHandler:^(id sender) {
                NSLog(@"ddddd");
            } forControlEvents:UIControlEventTouchUpInside];
        }];
        //标题
        NSArray *tNamesArr =[self.tvVM tNamesForRow:indexPath.section];
        NSArray *tNames=@[cell.titleLb1,cell.titleLb2,cell.titleLb3];
        [tNames enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text =tNamesArr[idx];
        }];
        
        //描述
        NSArray *titleArr =[self.tvVM titlesDesForRow:indexPath.section];
        NSArray *titleDes =@[cell.desLb1,cell.desLb2,cell.desLb3];
        [titleDes enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text = titleArr[idx];
        }];
        //评论
        NSArray *commentsArr =[self.tvVM commentsCountForRow:indexPath.section];
        NSArray *comments =@[cell.commentLb1,cell.commentLb2,cell.commentLb3];
        [comments enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.text =commentsArr[idx];
        }];
        return cell;
    }
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self.tableView.header beginRefreshing];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        RadioDetailViewController *vc =[[RadioDetailViewController alloc]initWithCid:[self.tvVM cidFoRow:indexPath.section]];
        vc.name =[self.tvVM cNameForRow:indexPath.section];
        NSLog(@"%@",[self.tvVM cidFoRow:indexPath.section] );
        [self.navigationController   pushViewController:vc animated:YES];
    }
    
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
