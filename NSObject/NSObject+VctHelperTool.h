//
//  NSObject+VctHelperTool.h
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (VctHelperTool)
/**获取当前视图的RootViewController（Nav级别）*/
+(UIViewController *)getCurrentRootVct;

/**获取当前屏幕显示的viewcontroller*/
+(UIViewController *)getCurrentVct;

/**获取当前屏幕中present出来的viewcontroller*/
+(UIViewController *)getPresentedVct;
@end

NS_ASSUME_NONNULL_END
