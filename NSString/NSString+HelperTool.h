//
//  NSString+HelperTool.h
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (HelperTool)
/**字符串是否为空*/
+(BOOL) stringIsNull:(NSString*)string;
/**如果对象为空则替换成-->空字符("")*/
+(NSString *) objectNullToEmptyString:(NSObject*)content;
/**如果字符串为空则替换成-->空字符("")*/
+(NSString *) stringNullToEmptyString:(NSString*)content;
/**如果字符串为空则替换成replaceString*/
+(NSString *) stringNullToReplaceStringWithSource:(NSString *)content withReplaceString:(NSString *)replaceString;
/**如果num为空则替换成replaceString*/
+(NSString *) numberNullToReplaceStringWithSource:(NSNumber *)content withReplaceString:(NSString *)replaceString;
/**根据内容长度获得宽度,高度  CGSize为最大宽高(不定宽高的方向大小可设为 MAXFLOAT )*/
+(CGSize) textSize:(NSString*)text AndSize:(CGSize)size AndFont:(UIFont *)font;
/**根据内容长度获得宽度,高度  CGSize为最大宽高(不定宽高的方向大小可设为 MAXFLOAT )*/
+(CGFloat) textHeight:(NSString*)text AndSize:(CGSize)size AndFont:(UIFont *)font;
/**根据内容长度获得宽度,高度  CGSize为最大宽高(不定宽高的方向大小可设为 MAXFLOAT )*/
+(CGFloat) textWidth:(NSString *)text AndSize:(CGSize)size AndFont:(UIFont *)font;
/**获取当前时间*/
+(NSString *) getCurrentTimeToStringWithFormat:(NSString *)format;
/**根据date转为string*/
+(NSString *) dateToString:(NSDate *)date  withFormat:(NSString *)format;
/**根据string转为date*/
+(NSDate *) stringToDate:(NSString *)dateString withFormat:(NSString *)format;
/**根据string转为新日期格式string*/
+(NSString *) stringToOtherDateFormat:(NSString *)dateString withOldFormat:(NSString *)oldFormat withNewFormat:(NSString *)newFormat;
@end

NS_ASSUME_NONNULL_END
