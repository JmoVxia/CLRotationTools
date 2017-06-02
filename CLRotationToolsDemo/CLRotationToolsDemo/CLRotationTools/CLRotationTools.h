//
//  CLRotationTools.h
//  CLControllerRotationToolsDemo
//
//  Created by JmoVxia on 2017/6/2.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CLRotationTools : NSObject

/**
 需要支持旋转的控制器

 @param needRotationViewController 控制器
 */
+ (void)needRotationViewController:(UIViewController *)needRotationViewController;

@end
