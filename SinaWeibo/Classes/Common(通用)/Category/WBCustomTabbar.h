//
//  WBCustomTabbar.h
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UITabBar;

#warning 因为WBCustomTabbar继承自UITabBar, 所以称为WBCustomTabBar的代理，也必须实现UITabBar的代理协议
@protocol WBCustumTabbarDelegate <UITabBarDelegate>
@optional
-(void)addButtonClick: (UITabBar*)tabBar;
@end

@interface WBCustomTabbar : UITabBar
@property (nonatomic, weak) id<WBCustumTabbarDelegate> delegate;
@end
