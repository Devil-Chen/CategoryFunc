//
//  NSObject+VctHelperTool.m
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import "NSObject+VctHelperTool.h"

@implementation NSObject (VctHelperTool)
//获取当前视图的RootViewController（Nav级别）
+(UIViewController *)getCurrentRootVct
{
    UIViewController *result;
    // Try to find the root view controller programmically
    // Find the top window (that is not an alert view or other window)
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    if (topWindow.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows)
        {
            if (topWindow.windowLevel == UIWindowLevelNormal)
                break;
        }
    }
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    id nextResponder = [rootView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        result = topWindow.rootViewController;
    else
        NSAssert(NO, @"Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:your RootViewController].");
    return result;
}

//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentVct
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else{
        if ([window.rootViewController isKindOfClass:[UINavigationController class]]) {
            for (UIViewController *vct in ((UINavigationController *)window.rootViewController).viewControllers) {
                if (vct.view.window) {
                    return vct;
                }
            }
        }else{
            result =window.rootViewController;
        }
        
    }
    return result;
}

//获取当前屏幕中present出来的viewcontroller
+(UIViewController *)getPresentedVct
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}
@end
