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

@property (nonatomic, strong) AddTabViewController *addTabViewController;

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
    WBCustomTabbar *tabbar = [[WBCustomTabbar alloc]init];
    //tabbar.delegate = self; // 此处OK
    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    // tabbar.delegate = self     ===>  Changing the delegate of a tabbar managed by a tab bar controller is not allowed
    // 不允许修改Tabbar的delegate属性(这个tabbar是被tabbarViewController所管理的)
    // 如果修改，需要放在修改tabbar的属性之前
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
//    AddTabViewController *vc = [[AddTabViewController alloc]init];
//    vc.view.frame = self.view.window.bounds;
//    //vc.view.backgroundColor = RGBColor(255, 0, 0, 0.3); //透明属性，就会不显示
//    UIImageView *imageView = [[UIImageView alloc]init];
//    vc.view.backgroundColor = [UIColor clearColor];
//    vc.view.x = 50;
//    vc.view.y = 100;
//    vc.view.width = 275;
//    vc.view.height = 300;
//    imageView.x = 0;
//    imageView.y = 0;
//    imageView.width = 275;
//    imageView.height = 300;
//    imageView.backgroundColor = [UIColor redColor];
//    [vc.view addSubview:imageView];
//    _addTabViewController = vc;
//    
//    //[self presentViewController:_addTabViewController animated:YES completion:nil];
//    [self.view addSubview:_addTabViewController.view];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[_addTabViewController removeFromParentViewController];
}
@end
