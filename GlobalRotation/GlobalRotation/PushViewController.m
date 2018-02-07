//
//  PushViewController.m
//  GlobalRotation
//
//  Created by JmoVxia on 2018/2/7.
//  Copyright © 2018年 JmoVxia. All rights reserved.
//

#import "PushViewController.h"
#import "UIViewController+CLRotation.h"
@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"本页面支持旋转";
    [self isNeedRotation:YES];
}


@end
