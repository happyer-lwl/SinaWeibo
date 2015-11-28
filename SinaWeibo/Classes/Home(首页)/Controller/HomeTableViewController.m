//
//  HomeTableViewController.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "DropMenu.h"
#import "TestTableView.h"

@interface HomeTableViewController ()

@property (nonatomic, weak) UIButton *titleButton;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithAction:@selector(searchFriend) target:self image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithAction:@selector(pop) target:self image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    UIButton *titleBtn = [[UIButton alloc]init];
    titleBtn.width = 200;
    titleBtn.height = 40;
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    // 设置文字颜色
    [titleBtn setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    UIColor *hightLightedColor = RGBColor(132, 73, 23, 1.0);
    [titleBtn setTitleColor:hightLightedColor forState:UIControlStateHighlighted];
    // 设置图片
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:(UIControlStateNormal)];
    // 设置图片的偏移
    [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 130, 0, 0)];
    // 设置文字的位置
    [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
    // 监听
    [titleBtn addTarget:self action:@selector(titleClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    _titleButton = titleBtn;
    
    self.navigationItem.titleView = _titleButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)titleClick{
    DropMenu *menu = [DropMenu menu];

    TestTableView *tableVC = [[TestTableView alloc]init];
    tableVC.view.height = 132;
    tableVC.view.width = 110;
    // 因为图片原因，不可设置宽度
    menu.contentController = tableVC;
    
    [menu showFrom:_titleButton];
}

-(void)searchFriend{
    
}

-(void)pop{
    
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

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
