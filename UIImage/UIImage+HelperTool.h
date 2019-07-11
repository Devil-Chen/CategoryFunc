//
//  UIImage+HelperTool.h
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HelperTool)
/**UIImage自定长宽缩放*/
- (UIImage *)reSizeImageToSize:(CGSize)reSize;
/**UIImage等比例缩放*/
- (UIImage *)scaleImageToScale:(CGFloat)scaleSize;
/**通过压缩图片质量让图片达到某个byte大小*/
- (UIImage *)compressImageQualityToByte:(NSInteger)maxLength;
/**通过压缩图片尺寸让图片达到某个byte大小*/
- (UIImage *)compressImageSizeToByte:(NSUInteger)maxLength;
/**照片旋转90度*/
-(UIImage*) rotateImage;
/**修复图片旋转*/
-(UIImage *) fixOrientation;
/**
 *  根据颜色和大小获取Image
 *  @param color 颜色
 *  @param size  大小
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
/**
 *  根据图片返回一张高斯模糊的图片
 *  @param blur 模糊系数
 *  @return 新的图片
 */
- (UIImage *)imageWithBlur:(CGFloat)blur;
/**
 *  图片剪切为圆形
 *  @return 剪切后的圆形图片
 */
- (UIImage *)roundImage;
/**
 *  屏幕截屏
 */
+ (UIImage *)cutScreen;
/**
 *  从给定UIView中截图：UIView转UIImage
 */
+ (UIImage *)cutWithView:(UIView *)view;
/**
 *  将UIView转成UIImage
 */
+(UIImage *) getImageWithView:(UIView *)theView;
/**
 *  从给定UIImage和指定Frame截图：
 */
- (UIImage *)cutWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
