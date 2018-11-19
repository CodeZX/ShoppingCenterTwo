//
//  TJ_CustomButton.h
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/14.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_BasicButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface TJ_CustomButton : TJ_BasicButton
- (instancetype)initWithTitle:( nullable NSString *)title titleColor:( nullable UIColor *)titleColor titleFont:( nullable UIFont *)font imageName:( nullable NSString *)imageName selectImageName:( nullable NSString *)selectImageName backgroundColor:( nullable UIColor *)backgroundColor;

- (instancetype)initWithTitle:( nullable NSString *)title titleColor:( nullable UIColor *)titleColor  backgroundColor:(nullable UIColor *)backgroundColor;

- (instancetype)initWithTitle:( nullable NSString *)title titleColor:( nullable UIColor *)titleColor titleFont:(UIFont *)font backgroundColor:(nullable UIColor *)backgroundColor;

@end

NS_ASSUME_NONNULL_END
