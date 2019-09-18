//
//  UIDevice+Udid.m
//  test5
//
//  Created by Devil on 2019/9/18.
//  Copyright © 2019 com.happy. All rights reserved.
//

#import "UIDevice+Udid.h"
#import "dlfcn.h"
#import "UIDevice+JailBreak.h"

@implementation UIDevice (Udid)
+ (NSString *) udid
{
    if ([UIDevice isJailBreak]) {
        void *gestalt = dlopen("/usr/lib/libMobileGestalt.dylib",RTLD_GLOBAL | RTLD_LAZY);
        CFStringRef (*MGCopyAnswer)(CFStringRef) =  (CFStringRef(*) (CFStringRef))(dlsym(gestalt, "MGCopyAnswer"));
        NSString *result = CFBridgingRelease(MGCopyAnswer(CFSTR("UniqueDeviceID")));
        dlclose(gestalt);
        return result;
    }else{
        NSLog(@"设备未越狱，没有权限获取UDID");
        return nil;
    }
}
@end
