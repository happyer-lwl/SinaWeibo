//
//  HMWSearchBar.m
//  HMW
//
//  Created by 刘伟龙 on 15/10/21.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "HMWSearchBar.h"

@implementation HMWSearchBar

- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入查询条件";
        
        // 输入框左侧icon创建
        UIImageView* searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc] init];
}

@end
