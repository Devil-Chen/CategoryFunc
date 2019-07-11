//
//  NSString+HelperTool.m
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import "NSString+HelperTool.h"

@implementation NSString (HelperTool)
//判断obj是否为null
+(BOOL)objectIsNull:(NSObject *)obj
{
    if (!obj || obj == [NSNull null] || obj == NULL) {
        return YES;
    }
    return NO;
}
//字符串是否为空
+(BOOL)stringIsNull:(NSString*)string
{
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    else if (string == NULL) {
        return YES;
    }
    else if (string == nil) {
        return YES;
    }
    else if ([string isKindOfClass:[NSNull class]]){
        return YES;
    }
    else if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"]
             ||[string isEqualToString:@""]){
        return YES;
    }
    else{
        return NO;
    }
}
//如果对象为空则替换成-->空字符("")
+(NSString *)objectNullToEmptyString:(NSObject*)content
{
    if ([content isKindOfClass:[NSNumber class]]){
        NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
        NSNumber *num = (NSNumber *)content;
        NSString * new = [numberFormatter stringFromNumber:num];
        if ([self stringIsNull:new]) {
            return @"0";
        }
        return new;
    }else if ([content isEqual:[NSNull null]]) {
        return @"";
    }else if ([content isKindOfClass:[NSNull class]]){
        return @"";
    }else{
        return @"";
    }
}
//如果字符串为空则替换成-->空字符("")
+(NSString *)stringNullToEmptyString:(NSString*)content
{
    if ([content isEqual:[NSNull null]]) {
        return @"";
    }
    else if (content == NULL) {
        return @"";
    }
    else if (content == nil) {
        return @"";
    }
    else if ([content isKindOfClass:[NSNull class]]){
        return @"";
    }
    else if ([content isEqualToString:@"(null)"] || [content isEqualToString:@"<null>"]
             ||[content isEqualToString:@""]){
        return @"";
    }
    else{
        return content;
    }
}
//如果字符串为空则替换成replaceString
+(NSString *)stringNullToReplaceStringWithSource:(NSString *)content withReplaceString:(NSString *)replaceString
{
    if([self stringIsNull:content]){
        return replaceString;
    }else{
        return content;
    }
}
//如果num为空则替换成replaceString
+(NSString *)numberNullToReplaceStringWithSource:(NSNumber *)content withReplaceString:(NSString *)replaceString
{
    if ([self objectIsNull:content]) {
        return replaceString;
    }else{
        return [NSString stringWithFormat:@"%@",content];
    }
}
//根据内容长度获得宽度,高度  CGSize为最大宽高(不定宽高的方向大小可设为 MAXFLOAT )
+(CGSize)textSize:(NSString*)text AndSize:(CGSize)size AndFont:(UIFont *)font
{
    if ([self stringIsNull:text]) {
        return CGSizeMake(0, 0);
    }
    //    NSDictionary* attributes = @{NSFontAttributeName : font };
    //    //       CGSize size = [text sizeWithAttributes:attributes];
    //    CGSize newSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    //    return newSize;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:2.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [text length])];
    
    CGSize newSize = CGSizeZero;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    CGRect textRect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    newSize = textRect.size;
#else
    newSize = [txt sizeWithFont:font constrainedToSize:size];
#endif
    
    newSize.width = ceilf(newSize.width);
    newSize.height = ceilf(newSize.height);
    return newSize;
}
//根据内容长度获得宽度,高度  CGSize为最大宽高(不定宽高的方向大小可设为 MAXFLOAT )
+(CGFloat)textHeight:(NSString*)text AndSize:(CGSize)size AndFont:(UIFont *)font
{
    if ([self stringIsNull:text]) {
        return 0;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:2.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [text length])];
    
    CGSize newSize = CGSizeZero;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    CGRect textRect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    newSize = textRect.size;
#else
    newSize = [txt sizeWithFont:font constrainedToSize:size];
#endif
    
    newSize.width = ceilf(newSize.width);
    newSize.height = ceilf(newSize.height);
    return newSize.height;
}
//根据内容长度获得宽度,高度  CGSize为最大宽高(不定宽高的方向大小可设为 MAXFLOAT )
+(CGFloat)textWidth:(NSString *)text AndSize:(CGSize)size AndFont:(UIFont *)font
{
    if ([self stringIsNull:text]) {
        return 0;
    }
    //    NSDictionary* attributes = @{NSFontAttributeName : font };
    //    //       CGSize size = [text sizeWithAttributes:attributes];
    //    CGSize newSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    //    return newSize.width;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:2.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [text length])];
    
    CGSize newSize = CGSizeZero;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    CGRect textRect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    newSize = textRect.size;
#else
    newSize = [txt sizeWithFont:font constrainedToSize:size];
#endif
    
    newSize.width = ceilf(newSize.width);
    newSize.height = ceilf(newSize.height);
    return newSize.width;
}

//获取当前时间
+(NSString *) getCurrentTimeToStringWithFormat:(NSString *)format
{
    NSDate *date = [NSDate date];
    NSTimeInterval sec = [date timeIntervalSinceNow];
    NSDate *currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:sec];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    NSString *strTime = [df stringFromDate:currentDate];
    return strTime;
}
//根据date转为string
+(NSString *) dateToString:(NSDate *)date  withFormat:(NSString *)format
{
    NSTimeInterval sec = [date timeIntervalSinceNow];
    NSDate *currentDate = [[NSDate alloc] initWithTimeIntervalSinceNow:sec];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    NSString *strTime = [df stringFromDate:currentDate];
    return strTime;
}
//根据string转位date
+(NSDate *) stringToDate:(NSString *)dateString withFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}
//根据string转为新日期格式string
+(NSString *) stringToOtherDateFormat:(NSString *)dateString withOldFormat:(NSString *)oldFormat withNewFormat:(NSString *)newFormat
{
    return [self dateToString:[self stringToDate:dateString withFormat:oldFormat] withFormat:newFormat];
}
@end
