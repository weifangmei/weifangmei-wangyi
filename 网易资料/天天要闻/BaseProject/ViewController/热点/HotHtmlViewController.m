//
//  HotHtmlViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotHtmlViewController.h"
#import "iCarousel.h"
#import "HotDetailVIewModel.h"
@interface HotHtmlViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)HotDetailVIewModel *detailVM;
@end

@implementation HotHtmlViewController
-(instancetype)initWithID:(NSString *)ID
{
    if ([super init]) {
        self.ID = ID;
        [Factory addBackItemToVC:self];
    }
    return self;
}
-(HotDetailVIewModel *)detailVM
{
    if (!_detailVM) {
        _detailVM = [[HotDetailVIewModel alloc]initWithID:self.ID];
    }
    return _detailVM;
}
-(UIWebView *)webView{
    if (!_webView) {
        _webView =[[UIWebView alloc]init];
        [_webView loadHTMLString:[self.detailVM bodyHtml] baseURL:nil];
        /** 设置webview 的地址*/
        _webView.delegate =self;
    }
    return _webView;
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.webView showProgress];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.webView hideProgress];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.webView hideProgress];
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.title =@"新闻详情";
     self.tabBarController.tabBar.hidden  = YES;
        [self.detailVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.view addSubview:self.webView];
            [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(64);
                make.left.bottom.right.mas_equalTo(0);
              
            }];
        }];
    
 }

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden  =NO;
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
