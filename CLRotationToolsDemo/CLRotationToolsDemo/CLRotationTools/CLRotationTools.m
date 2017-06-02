//
//  CLRotationTools.m
//  CLControllerRotationToolsDemo
//
//  Created by JmoVxia on 2017/6/2.
//  Copyright © 2017年 JmoVxia. All rights reserved.
//

#import "CLRotationTools.h"
#import <objc/message.h>
#import "AppDelegate.h"
@implementation CLRotationTools
+ (void)needRotationViewController:(UIViewController *)needRotationViewController{

    __weak typeof(UIViewController *) weakVC = needRotationViewController;
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    IMP originalIMP = method_getImplementation(class_getInstanceMethod([appDelegate class], @selector(application:supportedInterfaceOrientationsForWindow:)));
    
    IMP newIMP = imp_implementationWithBlock(^(id obj, UIApplication *application, UIWindow *window){
        if (!weakVC) {
            class_replaceMethod([appDelegate class], @selector(application:supportedInterfaceOrientationsForWindow:), originalIMP, method_getTypeEncoding(class_getInstanceMethod([appDelegate class], @selector(application:supportedInterfaceOrientationsForWindow:))));
        }
        return weakVC ? UIInterfaceOrientationMaskAll : UIInterfaceOrientationMaskPortrait;
    });
    
    class_replaceMethod([appDelegate class], @selector(application:supportedInterfaceOrientationsForWindow:), newIMP, method_getTypeEncoding(class_getInstanceMethod([appDelegate class], @selector(application:supportedInterfaceOrientationsForWindow:))));
}

@end
