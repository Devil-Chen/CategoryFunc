//
//  NSObject+TransformationModel.m
//  简单实现一下，需要高性能可以使用YYModel
//
//  Created by Devil on 2019/2/14.
//  Copyright © 2019 Devil. All rights reserved.
//

#import "NSObject+TransformationModel.h"
#import <objc/runTime.h>

@implementation NSObject (TransformationModel)

//获取对象所有属性：
+(NSArray*)propertyKeys:(Class)obj
{
    unsigned int outCount, i;
    
    objc_property_t *properties = class_copyPropertyList(obj, &outCount);
    
    NSMutableArray *keys = [[NSMutableArray alloc] initWithCapacity:outCount];
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        //        const char * attributes = property_getAttributes(property);//获取属性类型
        //        NSLog(@"%@",[NSString stringWithUTF8String:attributes]);
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        [keys addObject:propertyName];
        
    }
    
    free(properties);
    
    return keys;
}

/**
 通过字典赋值给对象,返回新创建的对象
 
 @param mClass 转换后的类型
 @param info 需要转换的字典
 @return 转换后的实例
 */
+(id) transformationModelWithTargetClass:(Class)mClass origDictionary:(NSDictionary *)info
{
    return [self transformationModelWithTargetClass:mClass propertyKeys:[self propertyKeys:mClass] origDictionary:info];
}

/**
 通过字典赋值给对象,返回新创建的对象
 
 @param mClass 转换后的类型
 @param info 需要转换的字典
 @return 转换后的实例
 */
+(id) transformationModelWithTargetClass:(Class)mClass propertyKeys:(NSArray *)propertyKeys origDictionary:(NSDictionary *)info
{
    BOOL ret = NO;
    NSObject *dataSource = [[mClass alloc] init];
    for (NSString *key in propertyKeys) {
        if ([info isKindOfClass:[NSDictionary class]]) {
            ret = ([info valueForKey:key]==nil)?NO:YES;
        }
        else
        {
            ret = [info respondsToSelector:NSSelectorFromString(key)];
        }
        if (ret) {
            id propertyValue = [info valueForKey:key];
            //该值不为NSNULL，并且也不为nil
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
                
                [dataSource setValue:propertyValue forKey:key];
            }
        }
    }
    return dataSource;
}

/**
 通过字典数组赋值给对象,返回对象数组
 
 @param mClass 转换后的类型
 @param infoArray 需要转换的字典数组
 @return 转换后的实例数组
 */
+(NSMutableArray *) transformationModelWithTargetClass:(Class)mClass origDictionaryArray:(NSArray *)infoArray
{
    NSMutableArray *contentArrays = [[NSMutableArray alloc] init];
    NSArray * propertyKeys = [self propertyKeys:mClass];
    for (NSDictionary *info in infoArray) {
        NSObject *object = [self transformationModelWithTargetClass:mClass propertyKeys:propertyKeys origDictionary:info];
        [contentArrays addObject:object];
    }
    return contentArrays;
}


/**
 通过字典赋值给对象,返回是否成功
 
 @param targetObject 需要赋值的对象
 @param info 需要转换的字典
 @return 返回成功/失败
 */
+(BOOL) transformationModelWithTarget:(NSObject*)targetObject origDictionary:(NSDictionary *)info
{
    BOOL ret = NO;
    for (NSString *key in [self propertyKeys:[targetObject class]]) {
        if ([info isKindOfClass:[NSDictionary class]]) {
            ret = ([info valueForKey:key]==nil)?NO:YES;
        }
        else
        {
            ret = [info respondsToSelector:NSSelectorFromString(key)];
        }
        if (ret) {
            id propertyValue = [info valueForKey:key];
            //该值不为NSNULL，并且也不为nil
            if (![propertyValue isKindOfClass:[NSNull class]] && propertyValue!=nil) {
                
                [targetObject setValue:propertyValue forKey:key];
            }
        }
    }
    return ret;
}
@end
