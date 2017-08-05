//
//  ViewController.m
//  ViewControllerRotation
//
//  Created by JmoVxia on 2017/8/5.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "PresentViewController.h"
#import "UIView+CLSetRect.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"不支持旋转";

    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(99, 99, 99, 99)];
    button1.CLcenterY = self.view.CLcenterY;
    button1.CLcenterX = self.view.CLwidth / 4.0;
    button1.backgroundColor = [UIColor lightGrayColor];
    [button1 setTitle:@"Push" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(99, 99, 99, 99)];
    button2.CLcenterY = self.view.CLcenterY;
    button2.CLcenterX = self.view.CLwidth / 4.0 * 3;
    button2.backgroundColor = [UIColor lightGrayColor];
    [button2 setTitle:@"Present" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

}
- (void)pushAction{
    [self.navigationController pushViewController:[PushViewController new] animated:YES];
}
- (void)presentAction{
    
    UINavigationController *nc = [UINavigationController new];
    [nc addChildViewController:[PresentViewController new]];
    [self presentViewController:nc animated:YES completion:nil];
}




@end
