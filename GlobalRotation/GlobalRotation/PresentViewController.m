//
//  PresentViewController.m
//  GlobalRotation
//
//  Created by JmoVxia on 2018/2/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import "PresentViewController.h"
#import "UIViewController+CLRotation.h"
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
    [self isNeedRotation:YES];

}
- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.button.center = self.view.center;
}


@end
