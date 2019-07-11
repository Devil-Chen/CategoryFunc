//
//  UITextField+HistoryRecord.h
//
//  Created by Devil on 2019/2/15.
//  Copyright © 2019 Devil. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (HistoryRecord)
/**
 *  保存历史记录的key
 */
@property (retain, nonatomic) NSString* identify;

/**
 *  加载历史记录
 *  @return 历史记录数组
 */
- (NSArray*) loadHistroy;

/**
 *  保存到NSUserDefaults
 */
- (void) synchronize;


/**
 显示历史记录
 */
- (void) showHistory;

/**
 隐藏历史记录
 */
- (void) hideHistroy;

/**
 情况历史记录
 */
- (void) clearHistory;
@end

NS_ASSUME_NONNULL_END
