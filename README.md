#前言
    在很多时候，我们开发的APP是只需要支持竖屏的，但是也会遇到一些特殊情况，比如视频全屏播放的时候需要支持其他方向，这种情况处理起来往往比较麻烦。基于这种某些特殊页面需要支持横竖屏切换的需求，简单封装了一个工具类，一句话调用就可以实现页面横竖屏切换。
#原理
    通过`runtime`来动态交换方法实现页面横竖屏切换的需求，再通过分类的特性来达到一句话调用。
#代码
    工具类中代码，利用`runtime`替换方法的特性，调用的时候把支持的方向修改为全部，这里使用`week`是防止循环引用，需要注意的是控制器被销毁后需要将方法替换回原来的方法，这样才可以达到只让当前页面支持横竖屏切换而不影响其他页面。
```
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
```

    分类中的代码，由于工具类中使用的方法，需要在`AppDelegate`中实现`application:supportedInterfaceOrientationsForWindow`方法，每次使用的时候不是很方便，于是利用分类的特性，给`AppDelegate`增加一个分类，在分类中实现对应的方法，这样就能够达到一句话调用即可让页面支持横竖屏切换。

#使用
    将工具类和分类一起拖拽到工程中，在需要支持横竖屏切换的控制器页面调用`[CLRotationTools needRotationViewController:self]`即可。

#效果图

![效果图](http://upload-images.jianshu.io/upload_images/1979970-0eb805f77c9f98a0.gif?imageMogr2/auto-orient/strip)


#总结
    虽然代码没有几行，但是也涉及到一些`runtime`和分类的相关知识。这里实现了APP大部分页面只需要竖屏，某些特殊页面需要横竖屏切换的情况，类似APP大部分页面需要支持横竖屏切换，某些特殊页面只需要竖屏的情况大家可以自行修改。如果喜欢，欢迎star。
