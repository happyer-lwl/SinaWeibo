//
//  WBCustomTabbar.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "WBCustomTabbar.h"

@interface WBCustomTabbar()

@property (nonatomic, weak) UIButton *addButton;

@end

@implementation WBCustomTabbar

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        UIButton *addButton = [[UIButton alloc]init];
        [addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [addButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        addButton.size = addButton.currentBackgroundImage.size;
        
        [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        _addButton = addButton;
        
        [self addSubview:_addButton];
    }
    
    return self;
}

-(void)addButtonClick{
    if ([self.delegate respondsToSelector:@selector(addButtonClick:)]) {
        [self.delegate addButtonClick:self];
    }
}

-(void)layoutSubviews{
    // 一定使用
    [super layoutSubviews];
    
    // 设置加号的位置
    _addButton.centerX = self.width * 0.5;
    _addButton.centerY = self.height * 0.5;
    
    //设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = kScreenWidth / 5;
    CGFloat tabbarButtonIndex = 0;

    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            
            // 设置x
            child.x = tabbarButtonW * tabbarButtonIndex;
            
            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

@end
