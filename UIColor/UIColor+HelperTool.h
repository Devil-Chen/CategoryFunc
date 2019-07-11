//
//  UIColor+HelperTool.h
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HelperTool)
/**UIColor转UIImage*/
+(UIImage*) createImageWithColor: (UIColor*) color;
/**颜色转换 IOS中十六进制的颜色转换为UIColor*/
+(UIColor *) colorWithHexString: (NSString *)color;
/**通过16进制数RGB获得颜色*/
+(UIColor *) UIColorFromRGB: (NSInteger)rgbValue;
/**随机生成颜色*/
+ (UIColor *)RandomColor;
/**
 *  生成渐变色
 *
 *  @param c1     头
 *  @param c2     尾
 *  @param height 范围
 *
 *  @return 渐变色
 */
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;
/**颜色半透明*/
- (UIColor *)colorForTranslucency;
@end

NS_ASSUME_NONNULL_END
