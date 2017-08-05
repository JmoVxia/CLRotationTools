//
//  PresentViewController.m
//  ViewControllerRotation
//
//  Created by JmoVxia on 2017/8/5.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()
/**button*/
@property (nonatomic, strong) UIButton *button;
@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"本页面支持旋转";
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(199, 199, 99, 99)];
    self.button.backgroundColor = [UIColor lightGrayColor];
    [self.button setTitle:@"消失" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];

}
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * 默认所有都不支持转屏,如需个别页面支持除竖屏外的其他方向，请在viewController重新下边这三个方法
 */
// 是否支持自动转屏
- (BOOL)shouldAutorotate {
    return YES;
}
// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.button.center = self.view.center;
}


@end
