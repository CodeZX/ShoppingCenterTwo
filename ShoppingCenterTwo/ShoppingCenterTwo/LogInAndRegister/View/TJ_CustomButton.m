//
//  TJ_CustomButton.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/14.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_CustomButton.h"

@implementation TJ_CustomButton


- (instancetype)initWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor backgroundColor:(nullable UIColor *)backgroundColor {
    
    return [self initWithTitle:title titleColor:titleColor titleFont:nil imageName:nil selectImageName:nil backgroundColor:backgroundColor];
    
}



- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)font backgroundColor:(UIColor *)backgroundColor {
    return [self initWithTitle:title titleColor:titleColor titleFont:font imageName:nil selectImageName:nil backgroundColor:backgroundColor];
}


- (instancetype)initWithTitle:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor titleFont:( nullable UIFont *)font imageName:(nullable NSString *)imageName selectImageName:(nullable NSString *)selectImageName backgroundColor:(nullable UIColor *)backgroundColor {
    
    self = [super init];
    if (self) {
        [self setTitle:title.length > 0?title:@"自定义Btn" forState:UIControlStateNormal];
        [self setTitleColor:titleColor?titleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = font?font:[UIFont systemFontOfSize:14];
        [self setImage:imageName.length > 0?[UIImage imageNamed:imageName]:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self setImage:selectImageName.length > 0?[UIImage imageNamed:selectImageName]:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        self.backgroundColor = backgroundColor?backgroundColor:MotifColor;
        [self setupUI];
    }
    return self;
}



- (void)setupUI {
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
}

@end
