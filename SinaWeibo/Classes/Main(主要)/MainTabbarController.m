//
//  MainTabbarController.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "MainTabbarController.h"
#import "WBCustomTabbar.h"
#import "AddTabViewController.h"

@interface MainTabbarController ()

@end

@implementation MainTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeTableViewController *homeVC = [[HomeTableViewController alloc]init];
    [self addChildVc:homeVC title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
  
    MessageTableViewController *messageVC = [[MessageTableViewController alloc]init];
    [self addChildVc:messageVC title:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    
    DiscoverTableViewController *discoverVC = [[DiscoverTableViewController alloc]init];
    [self addChildVc:discoverVC title:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    
    ProfileTableViewController *profileVC = [[ProfileTableViewController alloc]init];
    [self addChildVc:profileVC title:@"我的" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    
    // self.tabBar = [[WBCustomTabbar alloc]init];  只读属性，通过kvc来修改
    [self setValue:[[WBCustomTabbar alloc]init] forKeyPath:@"tabBar"];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addChildVc:(UIViewController *)childVC title: (NSString *)title image: (NSString*)image selectImage: (NSString *)selectedImage {
    
    // 设置子控制器的文字
    //childVC.tabBarItem.title = title;
    //childVC.navigationItem.title = title;
    childVC.title = title;
    // 图片
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字样式
    NSMutableDictionary *profileAttri = [NSMutableDictionary dictionary];
    profileAttri[NSForegroundColorAttributeName] = RGBColor(255.0, 111.0, -0, 1.0);
    [childVC.tabBarItem setTitleTextAttributes:profileAttri forState:UIControlStateSelected];
    profileAttri[NSForegroundColorAttributeName] = RGBColor(123, 123, 123, 1.0);
    [childVC.tabBarItem setTitleTextAttributes:profileAttri forState:UIControlStateNormal];
    
    // 设置子控制器的北京颜色, 设置view会创建该窗口，如果不设置则不会提前设置
    // childVC.view.backgroundColor = WBRandomColor;
    
    WBNavigationController* nav = [[WBNavigationController alloc]initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
}

#pragma mark WBCustomTabBarDelegate代理方法
-(void)addButtonClick:(UITabBar *)tabBar{
    AddTabViewController *vc = [[AddTabViewController alloc]init];
    vc.view.frame = CGRectMake(30, 300, 315, 300);
    [vc.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ViewController"]]];
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
