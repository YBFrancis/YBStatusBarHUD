//
//  ViewController.m
//  YBStatusBarHUDDemo
//
//  Created by yangbo on 15/7/31.
//  Copyright (c) 2015年 yangbo. All rights reserved.
//

#import "ViewController.h"
#import "YBStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 可以设定HUD的背景颜色
    [YBStatusBarHUD setHUDColor:[UIColor grayColor]];
}
- (IBAction)showSuccess {
    [YBStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)showError {
    [YBStatusBarHUD showError:@"加载失败"];
}

- (IBAction)showMessage {
    [YBStatusBarHUD showMessage:@"你输入的信息有误" image:nil];
}
- (IBAction)showWithState {
    [YBStatusBarHUD showWithState:@"正在拼命加载中"];
}
- (IBAction)dismiss:(id)sender {
    [YBStatusBarHUD dismiss];
}
@end
