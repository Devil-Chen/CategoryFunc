//
//  NSObject+MethodSwizzle.h
//
//  Created by Devil on 2019/2/14.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 方法交换帮助（方法交换时请特别注意类簇）
 */
@interface NSObject (MethodSwizzle)

/**
 方法交换
 @param origSel 原方法名
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigSel:(SEL)origSel newSel:(SEL)newSel;

/**
 方法交换 -- 不同target
 @param origSel 原方法名
 @param newTarget 新方法的类
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigSel:(SEL)origSel newTarget:(Class)newTarget newSel:(SEL)newSel;

/**
 方法交换 -- 不同target
 @param origTarget 原方法的类
 @param origSel 原方法名
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigTarget:(Class)origTarget OrigSel:(SEL)origSel newSel:(SEL)newSel;

/**
 方法交换 -- 两个都不同target
 @param origTarget 原方法的类
 @param origSel 原方法名
 @param newTarget 新方法的类
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigTarget:(Class)origTarget OrigSel:(SEL)origSel newTarget:(Class)newTarget newSel:(SEL)newSel;

/**
 类方法交换
 @param origSel 原类方法名
 @param newSel 新类方法名
 */
+(void) methodSwizzleWithOrigClassSel:(SEL)origSel newClassSel:(SEL)newSel;

/**
 类方法交换
 @param origSel 原类方法名
 @param newTarget 新方法的类(最好不要传对象实例，要传类对象，例如[obj class])
 @param newSel 新类方法名
 */
+(void) methodSwizzleWithOrigClassSel:(SEL)origSel newTarget:(Class)newTarget  newClassSel:(SEL)newSel;

@end


NS_ASSUME_NONNULL_END
