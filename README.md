# YBStatusBarHUD
- 一个简单易用的窗口HUD,有普通的提示功能，还可以自定义HUD背景颜色和图片。

## 1.提示正确信息

```objc
[YBStatusBarHUD showSuccess:@"加载成功"];
```
## 2.提示错误信息

```objc
[YBStatusBarHUD showError:@"加载失败"];
```

## 3.提示普通信息

```objc
// 图片可以自定义
[YBStatusBarHUD showMessage:@"你输入的信息有误" image:nil];
```

## 4.显示正在加载状态
```objc
[YBStatusBarHUD showWithState:@"正在拼命加载中"];
```

## 5.取消HUD
```objc
[YBStatusBarHUD dismiss];
```