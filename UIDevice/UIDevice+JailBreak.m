//
//  UIDevice+JailBreak.m
//  test5
//
//  Created by Devil on 2019/9/18.
//  Copyright © 2019 com.happy. All rights reserved.
//

#import "UIDevice+JailBreak.h"
#import "stdlib.h"

@implementation UIDevice (JailBreak)
/**
 * 判断设备是否越狱
 */
+ (BOOL)isJailBreak
{
    return  [UIDevice isHasReadAppFileAuthority] || [UIDevice isHasJailBreakAppOrFile] || [UIDevice isHasDyldInsertLibraries];
}

/**
 * 第一种：判断是否有获取其它App权限
 */
+ (BOOL) isHasReadAppFileAuthority
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"User/Applications/"]) {
        return YES;
    }else{
        return NO;
    }
}

/**
 * 第二种：判断是否存在apt和Cydia.app或者越狱文件
 */
+(BOOL) isHasJailBreakAppOrFile{
    BOOL isJailBreak = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]||[[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        isJailBreak = YES;
    }else{
        NSFileManager *fileManager=[NSFileManager defaultManager];
        NSArray *pathArray = @[@"/etc/ssh/sshd_config",
                               @"/usr/libexec/ssh-keysign",
                               @"/usr/sbin/sshd",
                               @"/usr/sbin/sshd",
                               @"/bin/sh",
                               @"/bin/bash",
                               @"/etc/apt",
                               @"/Application/Cydia.app/",
                               @"/Library/MobileSubstrate/MobileSubstrate.dylib"
                               ];
        for (NSString *path in pathArray) {
            isJailBreak = [fileManager fileExistsAtPath:path];
            // 如果存在这些目录，就是已经越狱
            if (isJailBreak) {
                break;
            }
        }
    }
    return isJailBreak;
}



/**
 * 第三种：判断环境变量DYLD_INSERT_LIBRARIES
 */
+ (BOOL) isHasDyldInsertLibraries
{
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    
    if (env != NULL) {
        return YES;
    }else{
        return NO;
    }
}
@end
