//
//  ViewController.m
//  GlobalRotation
//
//  Created by JmoVxia on 2017/8/5.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+CLRotation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)change:(UIButton*)sender {
    sender.selected = !sender.selected;
    [self isNeedRotation:sender.selected];
}


@end
