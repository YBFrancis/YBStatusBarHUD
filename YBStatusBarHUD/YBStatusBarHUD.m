//
//  YBStatusBarHUD.m
//  YBStatusBarHUD
//
//  Created by yangbo on 15/7/30.
//  Copyright (c) 2015年 yangbo. All rights reserved.
//

#import "YBStatusBarHUD.h"

static CGFloat const YBStatusBarHUDHeight = 20;
static CGFloat const YBStatusBarMessageFont = 14;
static CGFloat const YBStatusBarTimeInterval = 1.0;
static CGFloat const YBStatusBarAnimatinoTime = 0.3;

@implementation YBStatusBarHUD

static YBStatusBarHUD *hud_;
static UIColor *HUDColor_;
static NSTimer *timer_;

+ (void)setHUDColor:(UIColor *)HUDColor
{
    HUDColor_ = HUDColor;
}

+ (void)showHUD
{
    hud_.hidden = YES;
    hud_ = [[YBStatusBarHUD alloc] init];
    hud_.frame = CGRectMake(0, -YBStatusBarHUDHeight, [UIScreen mainScreen].bounds.size.width, YBStatusBarHUDHeight);
    hud_.backgroundColor = HUDColor_ ? HUDColor_ : [UIColor blueColor];
    hud_.windowLevel = UIWindowLevelAlert;
    hud_.hidden = NO;
    
    // 设置动画
    [UIView animateWithDuration:YBStatusBarAnimatinoTime animations:^{
        CGRect frame = hud_.frame;
        frame.origin.y = 0;
        hud_.frame = frame;
    }];
}

+ (void)showMessage:(NSString *)message image:(UIImage *)image
{
    [timer_ invalidate];
    [self showHUD];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = hud_.bounds;
    button.contentMode = UIViewContentModeCenter;
    if (image){ // 有图片就设置为按钮的图片
        [button setImage:image forState:UIControlStateNormal];
    }
    if (message) { // 有文字就设置为按钮的文字
        [button setTitle:message forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:YBStatusBarMessageFont];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [hud_ addSubview:button];
    
    // 规定时间消失
    timer_ = [NSTimer timerWithTimeInterval:YBStatusBarTimeInterval target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer_ forMode:NSDefaultRunLoopMode];
}

+ (void)showSuccess:(NSString *)message
{
    [self showMessage:message image:[UIImage imageNamed:@"YBStatusBarHUD.bundle/success"]];
}

+ (void)showError:(NSString *)message
{
    [self showMessage:message image:[UIImage imageNamed:@"YBStatusBarHUD.bundle/error"]];
}

+ (void)showWithState:(NSString *)message
{
    // 停掉定时器、防止上次时间回来后，调用dismiss取消HUD。
    [timer_ invalidate];
    timer_ = nil;
    [self showHUD];
    
    // 添加显示文字的label
    UILabel *label = [[UILabel alloc] initWithFrame:hud_.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:YBStatusBarMessageFont];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    [hud_ addSubview:label];
    
    // 添加加载指示器
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicator startAnimating];
    CGFloat labelW = [message sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:YBStatusBarMessageFont]}].width;
    CGFloat indicatorX = (hud_.frame.size.width - labelW) * 0.5 - 30;
    indicator.frame = CGRectMake(indicatorX, 0, YBStatusBarHUDHeight, YBStatusBarHUDHeight);
    [hud_ addSubview:indicator];
}

+ (void)dismiss
{
    // 设置动画
    [UIView animateWithDuration:YBStatusBarAnimatinoTime animations:^{
        CGRect frame = hud_.frame;
        frame.origin.y = -YBStatusBarHUDHeight;
        hud_.frame = frame;
    }completion:^(BOOL finished) {
        hud_.hidden = YES;
        hud_ = nil;
    }];
}
@end
