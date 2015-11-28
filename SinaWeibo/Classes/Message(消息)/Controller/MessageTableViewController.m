//
//  MessageTableViewController.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "MessageTableViewController.h"

@interface MessageTableViewController ()

@end

@implementation MessageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"写私信" style:(UIBarButtonItemStylePlain) target:self action:@selector(writePrivateMessage)];
    
    // 时机需要在didLoad之前(创建几个tableview时，如果没有使用view则没有创建，可以在此使用种)
    // 如果提前在addChild中使用view则会提前创建，需要将此放在viewWillAppear
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)writePrivateMessage{
    NSLog(@"写私信");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Message    %ld", indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestViewController *testVC = [[TestViewController alloc]init];
    testVC.title = @"Test";
    
    [self.navigationController pushViewController:testVC animated:YES];
    
}

@end
