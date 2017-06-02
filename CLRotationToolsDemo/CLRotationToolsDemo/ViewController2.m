//
//  ViewController2.m
//  CLControllerRotationToolsDemo
//
//  Created by JmoVxia on 2017/6/2.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import "ViewController2.h"
#import "CLRotationTools.h"
@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    [CLRotationTools needRotationViewController:self];


}

- (IBAction)dissMissAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

@end
