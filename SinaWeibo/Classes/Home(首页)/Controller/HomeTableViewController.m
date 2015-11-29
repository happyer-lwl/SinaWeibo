//
//  HomeTableViewController.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "TestTableView.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"

#import "AccountTool.h"

#import "WBTitleButton.h"

@interface HomeTableViewController ()

@property (nonatomic, weak) WBTitleButton *titleButton;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏的内容
    [self setupNav];
    
    // 设置用户信息
    //[self setupUserInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 设置导航栏的内容
-(void)setupNav{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithAction:@selector(searchFriend) target:self image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithAction:@selector(pop) target:self image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    /* 中间的标题按钮 */
    WBTitleButton *titleButton = [[WBTitleButton alloc] init];
    // 设置图片和文字
    NSString *name = [AccountTool account].name;
    [titleButton setTitle:name?name:@"首页" forState:UIControlStateNormal];
    // 监听标题点击
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _titleButton = titleButton;
    
    self.navigationItem.titleView = _titleButton;
}

// 设置用户信息
-(void)setupUserInfo{
    // API: https://api.weibo.com/2/users/show.json
    // access_token	false	string	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
    // uid	false	int64	需要查询的用户ID。
    
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    // 2.拼接请求参数
    AccountModel* model = [AccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = model.access_token;
    params[@"uid"] = model.uid;
    
    // 3.发送请求,成功或者失败都要隐藏ProgressHUD
    NSString *urlString = @"https://api.weibo.com/2/users/show.json";
    [mgr GET:urlString parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary* responseObject) {
        
        NSString *userName = responseObject[@"screen_name"];
        DBLog(@"请求成功-%@", userName);
       
        [_titleButton setTitle:userName forState:UIControlStateNormal];
            
        AccountModel *accountModel = [AccountTool account];
        accountModel.name = userName;
        [AccountTool saveAccount:accountModel];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DBLog(@"请求失败-%@", error);
        
        AccountModel *accountModel = [AccountTool account];
        [_titleButton setTitle:accountModel.name forState:UIControlStateNormal];
    }];
}


-(void)titleClick: (UIButton*)sender{
    // 创建下拉菜单
    DropMenu *menu = [DropMenu menu];
    menu.delegate = self;
    
    // 设置内容
    TestTableView *tableVC = [[TestTableView alloc]init];
    tableVC.view.height = 132;
    tableVC.view.width = 110;
    // 因为图片原因，不可设置宽度
    menu.contentController = tableVC;
    //显示
    [menu showFrom:_titleButton];
}

-(void)searchFriend{
    
}

-(void)pop{
    
}

#pragma mark - DropDownMenuDelegate 代理方法
-(void)dropDownMenuDidDismiss:(DropMenu *)menu{
    //[_titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    _titleButton.selected = NO;
}

-(void)dropDownMenuDidShow:(DropMenu *)menu{
    _titleButton.selected = YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}
@end
