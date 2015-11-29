//
//  WBOAuthViewController.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/28.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "WBOAuthViewController.h"
#import "AFNetworking.h"
#import "AFURLRequestSerialization.h"
#import "MainTabbarController.h"
#import "NewFeatureViewController.h"
#import "AccountModel.h"
#import "AccountTool.h"
#import "MBProgressHUD+MJ.h"

@interface WBOAuthViewController()<UIWebViewDelegate>

@end

@implementation WBOAuthViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 1 创建一个WebView
    UIWebView *webView = [[UIWebView alloc]init];
    webView.delegate = self;
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    
    // 2 用WebView加载登录界面
    // 请求地址:https://api.weibo.com/oauth2/authorize
    // 请求参数:
    // ClientID:     2469003819
    // Redirect_uri:
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2469003819&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    // 获取URL字符串
    NSString *urlString = request.URL.absoluteString;
    
    // 判断是否为回调地址
    NSRange range = [urlString rangeOfString:@"code="];
    if (range.length != 0) {
        int index = range.location + range.length;
        
        NSString *codeString = [urlString substringFromIndex:index];
        DBLog(@"Code is   %@", codeString);
        
        // 利用code换取一个accessToken
        [self accessTokenWithCode:codeString];
        
        // 禁止加载回调地址
        return NO;
    }
    
    return YES;
}
/**
 *  利用code换取access_token
 *
 *  @param code <#code description#>
 *
 *  @return <#return value description#>
 */
- (void)accessTokenWithCode:(NSString *)code
{
    /*
     URL：https://api.weibo.com/oauth2/access_token
     
     请求参数：
     client_id：申请应用时分配的AppKey
     client_secret：申请应用时分配的AppSecret
     grant_type：使用authorization_code
     redirect_uri：授权成功后的回调地址
     code：授权成功后返回的code
     */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
        //mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // AFN的AFJSONResponseSerializer默认不接受text/plain这种类型
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"2469003819";
    params[@"client_secret"] = @"d3f1f5a44dae0e1ae9186eeefdca5550";
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = @"http://www.baidu.com";
    params[@"code"] = code;
    
    // 3.发送请求,成功或者失败都要隐藏ProgressHUD
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
        [MBProgressHUD hideHUD];
        
        DBLog(@"请求成功-%@", responseObject);
        
        // 将返回的帐号字典数据  ---> 模型，存进沙盒
        AccountModel *accountModel = [AccountModel accountWithDict:responseObject]; 
        // 保存帐号信息
        [AccountTool saveAccount:accountModel];
            
        // 切换窗口的根控制器
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window switchRootViewController];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUD];
        DBLog(@"请求失败-%@", error);
    }];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showMessage:@"正在加载"];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUD];
}

@end
