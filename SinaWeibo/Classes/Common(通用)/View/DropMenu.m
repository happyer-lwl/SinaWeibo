//
//  DropMenu.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/27.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "DropMenu.h"

@interface DropMenu ()

@property (nonatomic, weak) UIImageView *containerView;

@end

@implementation DropMenu

-(UIImageView *)containerView{
    if (_containerView == nil) {
        UIImageView *dropdownMenu = [[UIImageView alloc]init];
        dropdownMenu.image = [UIImage imageNamed:@"popover_background"];
        //dropdownMenu.width = 217;
        dropdownMenu.height = 200;
        dropdownMenu.userInteractionEnabled = YES;
        
        [self addSubview:dropdownMenu];
        
        _containerView = dropdownMenu;
        
        DBLog(@"containerView");
    }
    
    return _containerView;
}

- (void)setContent:(UIView *)content{
    _content = content;
    
    _content.x = 10;
    _content.y = 15;

    self.containerView.height = CGRectGetMaxY(content.frame) + 10;
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    [self.containerView addSubview:_content];
}

- (void)setContentController:(UIViewController *)contentController{
    _contentController = contentController;
    
    self.content = _contentController.view;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

+ (instancetype)menu{
    return [[self alloc]init];
}

-(void)showFrom: (UIView*)fromView{
    // 获得最上层的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    // 添加自己到窗口上
    [window addSubview:self];
    
    // 设置尺寸 没有尺寸不显示
    self.frame = window.bounds;
    
    // 默认情况下，frame是以父控件左上角为坐标原点
    // 可以转换坐标系,两个等价，上面的是通过父控件的位置去转换，下面的是通过自己的位置去转换
    //CGRect newFrame = [fromView.superview convertRect:fromView.frame toView:window];
    CGRect newFrame = [fromView convertRect:fromView.bounds toView:window];
    
    // 设置位置
    _containerView.centerX = CGRectGetMidX(newFrame);
    _containerView.y = CGRectGetMaxY(newFrame);
    
    // 通过menu显示
    if ([self.delegate respondsToSelector:@selector(dropDownMenuDidShow:)]) {
        [self.delegate dropDownMenuDidShow:self];
    }
}

-(void)dismiss{
    [self removeFromSuperview];
    
    if ([self.delegate respondsToSelector:@selector(dropDownMenuDidDismiss:)]) {
        [self.delegate dropDownMenuDidDismiss:self];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}
@end
