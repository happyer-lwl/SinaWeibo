//
//  AppDelegate.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tab = [[UITabBarController alloc]init];
    self.window.rootViewController = tab;
    
    HomeTableViewController *homeVC = [[HomeTableViewController alloc]init];
    [self addChildVc:homeVC title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
    
    MessageTableViewController *messageVC = [[MessageTableViewController alloc]init];
    [self addChildVc:messageVC title:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    
    DiscoverTableViewController *discoverVC = [[DiscoverTableViewController alloc]init];
    [self addChildVc:discoverVC title:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discovr_selected"];
    
    ProfileTableViewController *profileVC = [[ProfileTableViewController alloc]init];
    [self addChildVc:profileVC title:@"我的" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    
    tab.viewControllers = @[homeVC, messageVC, discoverVC, profileVC];
//    [tab addChildViewController:vc1];
//    [tab addChildViewController:vc2];
//    [tab addChildViewController:vc3];
//    [tab addChildViewController:vc4];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(UIViewController *)addChildVc:(UIViewController *)childVC title: (NSString *)title image: (NSString*)image selectImage: (NSString *)selectedImage {

    // 设置子控制器的文字和图片
    childVC.tabBarItem.title = title;
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字样式
    NSMutableDictionary *profileAttri = [NSMutableDictionary dictionary];
    profileAttri[NSForegroundColorAttributeName] = RGBColor(255.0, 111.0, -0, 1.0);
    [childVC.tabBarItem setTitleTextAttributes:profileAttri forState:UIControlStateSelected];
    profileAttri[NSForegroundColorAttributeName] = RGBColor(123, 123, 123, 1.0);
    [childVC.tabBarItem setTitleTextAttributes:profileAttri forState:UIControlStateNormal];
    
    // 设置子控制器的北京颜色
    childVC.view.backgroundColor = WBRandomColor;
    
    return childVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
