//
//  HeadLineViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeadLineViewController.h"
#import "HeadlineViewModel.h"
#import "iCarousel.h"//实现3D效果
#import "HotCell.h"
#import "HotWebViewController.h"
@interface HeadLineViewController ()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)HeadlineViewModel *headVM;
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *heaImgURLs;
@property (nonatomic,strong)NSArray *titleArrs;

@end

@implementation HeadLineViewController
{//添加成员变量,因为不需要懒加载,所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}


/** 头部滚动视图 */
-(UIView *)headerView{
    [_timer invalidate];
    //如果当前没有头部视图,返回nil
    if(!self.heaImgURLs.count) return nil;
    NSLog(@"%ld",self.heaImgURLs.count);
    //头部视图origin无效,宽度无效,肯定是与table同宽
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    //添加底部视图
    UIView *botoomView = [UIView new];
  
    botoomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:botoomView];
    
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    _titleLb.text = self.titleArrs[0];
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.heaImgURLs.count;
    [botoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    
    //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(botoomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //如果只有一张图,则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图,则不可以滚动
    _ic.scrollEnabled = self.heaImgURLs.count != 1;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    
    if (self.heaImgURLs.count > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
-(WFMNavigationController *)naviInitWithType:(HeadlineType)type name:(NSString *)name{
   
      WFMNavigationController *navi =[[WFMNavigationController alloc]initWithRootViewController:[[HeadLineViewController alloc]initWithType:type name:name]];
    
    return navi;
}
#pragma mark - iCarousel Delegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.heaImgURLs.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
   
    for (NSString *path in self.heaImgURLs) {
        NSLog(@"%@",path);
    }
    [imageView setImageWithURL:[NSURL URLWithString:self.heaImgURLs[index]]placeholderImage:[UIImage imageNamed:@"lm_groupbuy_empty"]];
    
    return view;

}

/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/** 监控当前滚到到第几个 */
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    NSLog(@"%ld", carousel.currentItemIndex);
    _titleLb.text =self.titleArrs[carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
    NSLog(@"zz%ld",_pageControl.currentPage);
}
-(HeadlineViewModel *)headVM{
    if (!_headVM) {
        _headVM =[[HeadlineViewModel alloc]initWithType:_type];
    }
    return _headVM;
}

-(instancetype)initWithType:(HeadlineType)type name:(NSString *)name{
    if (self =[super init]) {
        _type = type;
        _titleName = name;
    }
    return  self;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HotCell class] forCellReuseIdentifier:@"hotCell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.headVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }
                else{
                    [_tableView reloadData];
                    self.heaImgURLs= [self.headVM headURLsForRow:0];
                    self.titleArrs=[self.headVM headTitlesForRow:0];
                    _tableView.tableHeaderView =[self headerView];
                    [_ic reloadData];
                   
                }
                [_tableView.header endRefreshing];
            }];
        }];
        _tableView.footer =[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.headVM getMoreDataCompletionHandle:^(NSError *error) {
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.headVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HotCell *cell =[tableView dequeueReusableCellWithIdentifier:@"hotCell"];
    
    cell.titleLb.text =[self.headVM titleForRow:indexPath.row];
  
    cell.longTitleLb.text =[self.headVM digestForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.headVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"lm_groupbuy_empty"]];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.header beginRefreshing];
     self.title = self.titleName;
    [Factory addMenuItemToVC:self];
  
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HotWebViewController *vc =[[HotWebViewController alloc]initWithURL:[self.headVM dizhiURLForRow:indexPath.row]];
    
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
