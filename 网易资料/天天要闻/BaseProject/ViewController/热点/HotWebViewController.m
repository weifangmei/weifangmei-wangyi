//
//  HotWebViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HotWebViewController.h"

@interface HotWebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation HotWebViewController
-(instancetype)initWithURL:(NSURL *)url{
    if (self =[super init]) {
        _url = url;
    }
    return self;
}
-(UIWebView *)webView{
    if (!_webView) {
        _webView =[UIWebView new];
        _webView.delegate =self;
        [_webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        
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
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(-44);
        make.bottom.right.left.mas_equalTo(0);
    }];
    [Factory addBackItemToVC:self];
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
