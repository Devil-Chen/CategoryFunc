//
//  UIView+HelperTool.m
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import "UIView+HelperTool.h"

@implementation UIView (HelperTool)
//拷贝view
-(UIView*) copyView
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:self];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
}
//隐藏或显示UIView及其子view
-(void) hideOrDisplayViewAndChildView:(BOOL)isHide
{
    for (UIView *childView in [self subviews]) {
        childView.hidden = isHide;
    }
    self.hidden = isHide;
}

//隐藏或显示UIView的子view（只隐藏子view，本view不隐藏）
-(void) hideOrDisplayChildViewInView:(BOOL)isHide
{
    for (UIView *childView in [self subviews]) {
        childView.hidden = isHide;
    }
}
//圆形图片(长宽必须相等,加了一像素边框)
-(void) circleView
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width * 0.5;
    
}

//设置四个角为相同的弧度
-(void) setCornerRadius:(CGFloat)size
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = size;
}
//设置四个角为相同的弧度,去掉多余的地方
-(void) setCornerRadiusAndBoder:(CGFloat)size withBoderWidth:(CGFloat)width withColor:(UIColor *)color
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = size;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}
//设置四个角的弧度
-(void) setCornerRadius:(WhichEdge)whichEdge withRadian:(CGFloat)size
{
    if (whichEdge.leftTop == 0 && whichEdge.leftBottom == 0 && whichEdge.rightTop == 0 && whichEdge.rightBottom == 0) {
        return;
    }
    UIRectCorner rectCorner = -1;
    if (whichEdge.leftTop > 0) {
        rectCorner = UIRectCornerTopLeft;
    }
    if (whichEdge.leftBottom > 0) {
        if (rectCorner == -1) {
            rectCorner = UIRectCornerBottomLeft;
        }else{
            rectCorner = rectCorner |UIRectCornerBottomLeft;
        }
    }
    if (whichEdge.rightTop > 0) {
        if (rectCorner == -1) {
            rectCorner = UIRectCornerTopRight;
        }else{
            rectCorner = rectCorner |UIRectCornerTopRight;
        }
    }
    if (whichEdge.rightBottom > 0) {
        if (rectCorner == -1) {
            rectCorner = UIRectCornerBottomRight;
        }else{
            rectCorner = rectCorner | UIRectCornerBottomRight;
        }
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(size, size)];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}
//设置border
-(void) setViewBorder:(CGFloat)width withColor:(UIColor *)color
{
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}
//在view的四边加border(MyRectCorner:四边所需border宽度)
-(void) setViewBorderWithRectCorner:(DevilRectCorner)directionWith withColor:(UIColor *)color
{
    if(directionWith.top == 0 && directionWith.bottom == 0 && directionWith.left ==0 &&directionWith.right == 0 ){
        return;
    }
    if (directionWith.top >0) {
        CALayer *bottomBorder = [CALayer layer];
        float width=self.frame.size.width;
        bottomBorder.frame = CGRectMake(0.0f, 0.0f, width, directionWith.top);
        bottomBorder.backgroundColor = color.CGColor;
        [self.layer addSublayer:bottomBorder];
    }
    if (directionWith.left >0) {
        CALayer *bottomBorder = [CALayer layer];
        float height=self.frame.size.height;
        bottomBorder.frame = CGRectMake(0.0f, 0.0f, directionWith.left, height);
        bottomBorder.backgroundColor = color.CGColor;
        [self.layer addSublayer:bottomBorder];
    }
    if (directionWith.right >0) {
        CALayer *bottomBorder = [CALayer layer];
        float height=self.frame.size.height;
        float width=self.frame.size.width-directionWith.right;
        bottomBorder.frame = CGRectMake(width, 0.0f, directionWith.right, height);
        bottomBorder.backgroundColor = color.CGColor;
        [self.layer addSublayer:bottomBorder];
    }
    if (directionWith.bottom >0) {
        CALayer *bottomBorder = [CALayer layer];
        float height=self.frame.size.height-directionWith.bottom;
        float width=self.frame.size.width;
        bottomBorder.frame = CGRectMake(0.0f, height, width, directionWith.bottom);
        bottomBorder.backgroundColor = color.CGColor;
        [self.layer addSublayer:bottomBorder];
        
    }
    
}

//在view的四边加border(withCornerRadius:弧度)
-(void) setViewBorder:(CGFloat)width withColor:(UIColor *)color withCornerRadius:(CGFloat)size
{
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = size;
}
@end
