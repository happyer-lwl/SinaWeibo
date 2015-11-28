//
//  DropMenu.h
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DropMenu;

@protocol WBDropDownDelegate <NSObject>
-(void)dropDownMenuDidDismiss: (DropMenu*)menu;
-(void)dropDownMenuDidShow: (DropMenu*)menu;
@end

@interface DropMenu : UIView

@property (nonatomic, weak) id<WBDropDownDelegate> delegate;

+ (instancetype)menu;

- (void)showFrom: (UIView*)fromView;
- (void)dismiss;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;
/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;
@end
