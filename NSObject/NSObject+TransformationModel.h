//
//  NSObject+TransformationModel.h
//  简单实现一下，需要高性能可以使用YYModel
//
//  Created by Devil on 2019/2/14.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TransformationModel)
//获取对象所有属性：
+(NSArray*)propertyKeys:(Class)obj;
/**
 通过字典赋值给对象,返回新创建的对象

 @param mClass 转换后的类型
 @param info 需要转换的字典
 @return 转换后的实例
 */
+(id) transformationModelWithTargetClass:(Class)mClass origDictionary:(NSDictionary *)info;

/**
 通过字典数组赋值给对象,返回对象数组

 @param mClass 转换后的类型
 @param infoArray 需要转换的字典数组
 @return 转换后的实例数组
 */
+(NSMutableArray *) transformationModelWithTargetClass:(Class)mClass origDictionaryArray:(NSArray *)infoArray;


/**
 通过字典赋值给对象,返回是否成功

 @param targetObject 需要赋值的对象
 @param info 需要转换的字典
 @return 返回成功/失败
 */
+(BOOL) transformationModelWithTarget:(NSObject*)targetObject origDictionary:(NSDictionary *)info;
@end

NS_ASSUME_NONNULL_END
