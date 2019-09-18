//
//  UIDevice+JailBreak.h
//  test5
//
//  Created by Devil on 2019/9/18.
//  Copyright © 2019 com.happy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (JailBreak)
/**
 * 判断设备是否越狱
 */
+ (BOOL)isJailBreak;
@end

NS_ASSUME_NONNULL_END
