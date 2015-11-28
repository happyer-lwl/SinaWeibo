//
//  TestTableView.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "TestTableView.h"

@implementation TestTableView

- (void)viewDidLoad{
    self.tableView.rowHeight = 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Menu    %ld", indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DBLog(@"click %ld", (long)indexPath.row);
}
@end
