//
//  NSObject+MethodSwizzle.m
//
//  Created by Devil on 2019/2/14.
//  Copyright © 2019 Devil. All rights reserved.
//

#import "NSObject+MethodSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (MethodSwizzle)
//+ (Class)class {
//    return self;
//}
//
//- (Class)class {
//    return object_getClass(self);
//}

/**
 方法交换
 @param origSel 原方法名
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigSel:(SEL)origSel newSel:(SEL)newSel
{
    //类对象（实例方法存储在类对象中） -- 由于此方法是类方法，所以self是类对象
    Class mClass = [self class];
    //方法
    Method origMethod = class_getInstanceMethod(mClass, origSel);
    Method newMethod = class_getInstanceMethod(mClass, newSel);
    if (!origMethod) {//原方法没实现
        class_addMethod(mClass, origSel, imp_implementationWithBlock(^(id self, SEL _cmd){}), "v16@0:8");
        origMethod = class_getInstanceMethod(mClass, origSel);
    }

    //imp
    IMP origIMP = method_getImplementation(origMethod);
    IMP newIMP = method_getImplementation(newMethod);

    //方法添加成功代表target中不包含原方法，可能是其父类包含(交换父类方法可能有意想不到的问题)
    if(class_addMethod(mClass, origSel, origIMP, method_getTypeEncoding(origMethod))){
        //直接替换新添加的方法
        class_replaceMethod(mClass, origSel, newIMP, method_getTypeEncoding(newMethod));
    }else{
        method_setImplementation(origMethod, newIMP);
        method_setImplementation(newMethod, origIMP);
    }
}
/**
 方法交换 -- 不同target
 @param origSel 原方法名
 @param newTarget 新方法的类
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigSel:(SEL)origSel newTarget:(Class)newTarget newSel:(SEL)newSel
{
    //类对象（实例方法存储在类对象中） -- 由于此方法是类方法，所以self是类对象
    Class mClass = [self class];
    Class newTargetClass = newTarget;
    if ([newTarget isKindOfClass:[newTarget class]]) {//成立则newTarget为实例对象
        newTargetClass = object_getClass(newTarget);
    }
    
    Method origMethod = class_getInstanceMethod(mClass, origSel);
    Method newMethod = class_getInstanceMethod(newTargetClass, newSel);
    
    if (!origMethod) {//原方法没实现
        class_addMethod(mClass, origSel, imp_implementationWithBlock(^(id self, SEL _cmd){}), "v16@0:8");
        origMethod = class_getInstanceMethod(mClass, origSel);
    }
    
    IMP origIMP = method_getImplementation(origMethod);
    IMP newIMP = method_getImplementation(newMethod);
    
    //方法添加成功代表target中不包含原方法，可能是其父类包含
    if(class_addMethod(mClass, origSel, origIMP, method_getTypeEncoding(origMethod))){
        //直接替换新添加的方法
        class_replaceMethod(mClass, origSel, newIMP, method_getTypeEncoding(newMethod));
    }else{
        method_setImplementation(origMethod, newIMP);
        method_setImplementation(newMethod, origIMP);
    }
}

/**
 方法交换
 @param origTarget 被交换方法的类
 @param origSel 原方法名
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigTarget:(Class)origTarget OrigSel:(SEL)origSel newSel:(SEL)newSel
{
    //类对象（实例方法存储在类对象中）
    Class origClass = origTarget;
    if ([origTarget isKindOfClass:[origTarget class]]) {//成立则origTarget为实例对象
        origClass = object_getClass(origTarget);
    }
    //方法
    Method origMethod = class_getInstanceMethod(origClass, origSel);
    Method newMethod = class_getInstanceMethod(origClass, newSel);
    if (!origMethod) {//原方法没实现
        class_addMethod(origClass, origSel, imp_implementationWithBlock(^(id self, SEL _cmd){}), "v16@0:8");
        origMethod = class_getInstanceMethod(origClass, origSel);
    }
    
    //imp
    IMP origIMP = method_getImplementation(origMethod);
    IMP newIMP = method_getImplementation(newMethod);
    
    //方法添加成功代表target中不包含原方法，可能是其父类包含(交换父类方法可能有意想不到的问题)
    if(class_addMethod(origClass, origSel, origIMP, method_getTypeEncoding(origMethod))){
        //直接替换新添加的方法
        class_replaceMethod(origClass, origSel, newIMP, method_getTypeEncoding(newMethod));
    }else{
        method_setImplementation(origMethod, newIMP);
        method_setImplementation(newMethod, origIMP);
    }
}

/**
 方法交换 -- 两个都不同target
 @param origTarget 原方法的类
 @param origSel 原方法名
 @param newTarget 新方法的类
 @param newSel 新方法名
 */
+(void) methodSwizzleWithOrigTarget:(Class)origTarget OrigSel:(SEL)origSel newTarget:(Class)newTarget newSel:(SEL)newSel
{
    //类对象（实例方法存储在类对象中）
    Class origClass = origTarget;
    if ([origTarget isKindOfClass:[origTarget class]]) {//成立则origTarget为实例对象
        origClass = object_getClass(origTarget);
    }
    Class newTargetClass = newTarget;
    if ([newTarget isKindOfClass:[newTarget class]]) {//成立则newTarget为实例对象
        newTargetClass = object_getClass(newTarget);
    }
    //方法
    Method origMethod = class_getInstanceMethod(origClass, origSel);
    Method newMethod = class_getInstanceMethod(newTargetClass, newSel);
    if (!origMethod) {//原方法没实现
        class_addMethod(origClass, origSel, imp_implementationWithBlock(^(id self, SEL _cmd){}), "v16@0:8");
        origMethod = class_getInstanceMethod(origClass, origSel);
    }
    
    //imp
    IMP origIMP = method_getImplementation(origMethod);
    IMP newIMP = method_getImplementation(newMethod);
    
    //方法添加成功代表target中不包含原方法，可能是其父类包含(交换父类方法可能有意想不到的问题)
    if(class_addMethod(origClass, origSel, origIMP, method_getTypeEncoding(origMethod))){
        //直接替换新添加的方法
        class_replaceMethod(origClass, origSel, newIMP, method_getTypeEncoding(newMethod));
    }else{
        method_setImplementation(origMethod, newIMP);
        method_setImplementation(newMethod, origIMP);
    }
}

/**
 类方法交换
 @param origSel 原类方法名
 @param newSel 新类方法名
 */
+(void) methodSwizzleWithOrigClassSel:(SEL)origSel newClassSel:(SEL)newSel
{
    //元类（类方法存储在元类对象中）
    Class metaClass = object_getClass([self class]);
    //方法
    Method origMethod = class_getInstanceMethod(metaClass, origSel);
    Method newMethod = class_getInstanceMethod(metaClass, newSel);
    if (!origMethod) {//原方法没实现
        class_addMethod(metaClass, origSel, imp_implementationWithBlock(^(id self, SEL _cmd){}), "v16@0:8");
        origMethod = class_getInstanceMethod(metaClass, origSel);
    }
    
    //imp
    IMP origIMP = method_getImplementation(origMethod);
    IMP newIMP = method_getImplementation(newMethod);
    
    //方法添加成功代表target中不包含原方法，可能是其父类包含(交换父类方法可能有意想不到的问题)
    if(class_addMethod(metaClass, origSel, origIMP, method_getTypeEncoding(origMethod))){
        //直接替换新添加的方法
        class_replaceMethod(metaClass, origSel, newIMP, method_getTypeEncoding(newMethod));
    }else{
        method_setImplementation(origMethod, newIMP);
        method_setImplementation(newMethod, origIMP);
    }
}

/**
 类方法交换
 @param origSel 原类方法名
 @param newTarget 新方法的类(最好不要传对象实例，要传类对象，例如[obj class])
 @param newSel 新类方法名
 */
+(void) methodSwizzleWithOrigClassSel:(SEL)origSel newTarget:(Class)newTarget  newClassSel:(SEL)newSel
{
    //元类（类方法存储在元类对象中）
    Class metaClass = object_getClass([self class]);
    Class newTargetMetaClass;
//    - (BOOL)isKindOf:aClass
//    {
//        Class cls;
//        for (cls = isa; cls; cls = cls->superclass)
//            if (cls == (Class)aClass)
//                return YES;
//        return NO;
//    }
    if ([newTarget isKindOfClass:[newTarget class]]) {//成立则newTarget为实例对象
//        NSLog(@"不能传对象实例，要传类对象，例如[obj class]，硬要传我也有做处理");
        newTargetMetaClass = object_getClass(object_getClass(newTarget));
    }else{
        newTargetMetaClass = object_getClass(newTarget);
    }
    
    //方法
    Method origMethod = class_getInstanceMethod(metaClass, origSel);
    Method newMethod = class_getInstanceMethod(newTargetMetaClass, newSel);
    if (!origMethod) {//原方法没实现
        class_addMethod(metaClass, origSel, imp_implementationWithBlock(^(id self, SEL _cmd){}), "v16@0:8");
        origMethod = class_getInstanceMethod(metaClass, origSel);
    }
    
    //imp
    IMP origIMP = method_getImplementation(origMethod);
    IMP newIMP = method_getImplementation(newMethod);
    
    //方法添加成功代表target中不包含原方法，可能是其父类包含(交换父类方法可能有意想不到的问题)
    if(class_addMethod(metaClass, origSel, origIMP, method_getTypeEncoding(origMethod))){
        //直接替换新添加的方法
        class_replaceMethod(metaClass, origSel, newIMP, method_getTypeEncoding(newMethod));
    }else{
        method_setImplementation(origMethod, newIMP);
        method_setImplementation(newMethod, origIMP);
    }
}

@end
