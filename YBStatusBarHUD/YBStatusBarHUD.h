//
//  YBStatusBarHUD.h
//  YBStatusBarHUD
//
//  Created by yangbo on 15/7/30.
//  Copyright (c) 2015年 yangbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBStatusBarHUD : UIWindow

/**
 *  HUD的背景颜色，默认为红色
 */
+ (void)setHUDColor:(UIColor *)HUDColor;

/**
 *  展示普通信息
 *
 *  @param message 展示的信息
 *  @param image   展示的图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;

/** 提示正确信息 */
+ (void)showSuccess:(NSString *)message;

/** 提示错误信息 */
+ (void)showError:(NSString *)message;

/** 提示正在加载信息 */
+ (void)showWithState:(NSString *)message;

/** 隐藏HUD */
+ (void)dismiss;

@end
