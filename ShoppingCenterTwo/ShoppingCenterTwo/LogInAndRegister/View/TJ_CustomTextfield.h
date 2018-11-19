//
//  TJ_CustomTextfield.h
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_BasicTextField.h"

NS_ASSUME_NONNULL_BEGIN

@class TJ_CustomTextfield,TJ_VerificationCodeButton;

@protocol  TJ_CustomTextfieldDelegate <NSObject>
@optional
- (void)customTextfield:(TJ_CustomTextfield *)textfield didObtainAuthCodeForAuthCodeBtn:(TJ_VerificationCodeButton *)authCodeBtn;
@required
@end

@interface TJ_CustomTextfield : TJ_BasicTextField
- (instancetype)initWithPlaceholderString:(nullable NSString *)placeholderString leftImagName:( nullable NSString *)leftImagName rightImageName:(nullable NSString *)rightImageName;
- (void)setCalculagraphForCountDown:(NSTimeInterval)timeInterval;
@property (nonatomic,weak) id<TJ_CustomTextfieldDelegate> customDelegate;
@end

NS_ASSUME_NONNULL_END
