//
//  TJ_CustomLabel.h
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/15.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_BasicLabel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJ_CustomLabel : TJ_BasicLabel
- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor;
- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor;
@end

NS_ASSUME_NONNULL_END
