//
//  MainTabbarController.h
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//  主控制

#import <UIKit/UIKit.h>
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
#import "WBNavigationController.h"
#import "WBCustomTabbar.h"

@interface MainTabbarController : UITabBarController<WBCustumTabbarDelegate>

@end
