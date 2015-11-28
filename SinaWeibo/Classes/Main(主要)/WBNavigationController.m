//
//  WBNavigationController.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "WBNavigationController.h"
#import "UIBarButtonItem+Extension.h"

@interface WBNavigationController ()

@end

@implementation WBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置整个项目的Item的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 普通状态
    NSMutableDictionary *textAttri = [NSMutableDictionary dictionary];
    textAttri[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttri[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttri forState:UIControlStateNormal];
    
    // 禁用状态
    NSMutableDictionary *textAttriDisable = [NSMutableDictionary dictionary];
    textAttriDisable[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttriDisable[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttriDisable forState:UIControlStateDisabled];
}

-(void)backToPre{
    [self popViewControllerAnimated:YES];
}

-(void)backToMain{
    [self popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIBarButtonItem *leftButtonItem = [UIBarButtonItem itemWithAction:@selector(backToPre) target:self image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        
        UIBarButtonItem *rightButtonItem = [UIBarButtonItem itemWithAction:@selector(backToMain) target:self image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
        
        viewController.navigationItem.leftBarButtonItem = leftButtonItem;
        viewController.navigationItem.rightBarButtonItem = rightButtonItem;
    }
    [super pushViewController:viewController animated:animated];
}

@end
