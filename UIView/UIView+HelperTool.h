//
//  UIView+HelperTool.h
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//用来获取四个角的弧度
typedef struct WhichEdge {
    CGFloat leftTop, leftBottom, rightTop, rightBottom;
} WhichEdge;
UIKIT_STATIC_INLINE WhichEdge WhichEdgeMake(CGFloat leftTop, CGFloat leftBottom, CGFloat rightTop, CGFloat rightBottom) {
    WhichEdge which = {leftTop, leftBottom, rightTop, rightBottom};
    return which;
}
//用来获取四个边的弧度
typedef struct DevilRectCorner {
    CGFloat top, bottom, left, right;
} DevilRectCorner;
UIKIT_STATIC_INLINE DevilRectCorner MyRectCornerMake(CGFloat top, CGFloat bottom, CGFloat left, CGFloat right) {
    DevilRectCorner corner = {top, bottom, left, right};
    return corner;
}


@interface UIView (HelperTool)
/**拷贝view*/
-(UIView*) copyView;
/**隐藏或显示UIView及其子view*/
-(void) hideOrDisplayViewAndChildView:(BOOL)isHide;
/**隐藏或显示UIView的子view（只隐藏子view，本view不隐藏）*/
-(void) hideOrDisplayChildViewInView:(BOOL)isHide;
/**圆形View(长宽必须相等)*/
-(void) circleView;
/**设置四个角为相同的弧度,去掉多余的地方*/
-(void) setCornerRadius:(CGFloat)size;
/**设置四个角为相同的弧度,去掉多余的地方*/
-(void) setCornerRadiusAndBoder:(CGFloat)size withBoderWidth:(CGFloat)width withColor:(UIColor *)color;
/**设置四个角的弧度,去掉多余的地方(WhichEdge-->大于0的角有弧度)*/
-(void) setCornerRadius:(WhichEdge)whichEdge withRadian:(CGFloat)size;
/**设置border(四条边同时设置)*/
-(void) setViewBorder:(CGFloat)width withColor:(UIColor *)color;
/**分别在view的四边加border(MyRectCorner:四边所需border宽度)*/
-(void) setViewBorderWithRectCorner:(DevilRectCorner)directionWith withColor:(UIColor *)color;
/**在view的四边加border,去掉多余的地方(withCornerRadius:弧度)*/
-(void) setViewBorder:(CGFloat)width withColor:(UIColor *)color withCornerRadius:(CGFloat)size;
@end

NS_ASSUME_NONNULL_END
