//
//  TJ_CustomLabel.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/15.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_CustomLabel.h"

@implementation TJ_CustomLabel

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor {
    self = [super init];
    if (self) {
        self.text = title?title:@"CustomLabel";
        self.tintColor = titleColor?titleColor:[UIColor blackColor];
        self.font = titleFont?titleFont:[UIFont systemFontOfSize:12];
        self.backgroundColor =backgroundColor?backgroundColor:[UIColor orangeColor];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    
    return [self initWithTitle:title titleColor:titleColor titleFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor orangeColor]];
}

@end
