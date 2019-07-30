//
//  NSObject+Udid.m
//  获取Udid
//
//  Created by Devil on 2019/7/30.
//  Copyright © 2019 Devil. All rights reserved.
//

#import "NSObject+Udid.h"
#import "dlfcn.h"

@implementation NSObject (Udid)
- (NSString *) udid
{
    void *gestalt = dlopen("/usr/lib/libMobileGestalt.dylib",RTLD_GLOBAL | RTLD_LAZY);
    CFStringRef (*MGCopyAnswer)(CFStringRef) =  (CFStringRef(*) (CFStringRef))(dlsym(gestalt, "MGCopyAnswer"));
    NSString *result = CFBridgingRelease(MGCopyAnswer(CFSTR("UniqueDeviceID")));
    dlclose(gestalt);
    return result;
}
@end
