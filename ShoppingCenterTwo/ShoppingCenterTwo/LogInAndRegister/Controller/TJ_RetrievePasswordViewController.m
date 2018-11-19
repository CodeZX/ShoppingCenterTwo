//
//  TJ_RetrievePasswordViewController.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/16.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_RetrievePasswordViewController.h"
#import "TJ_CustomTextfield.h"
#import "TJ_CustomButton.h"
#import "TJ_CustomLabel.h"
#import "TJ_ClauseViewController.h"
#import "TJ_RetrievePasswordViewController.h"

@interface TJ_RetrievePasswordViewController ()<UITextFieldDelegate>
@property (nonatomic,weak) TJ_CustomTextfield *phoneNumberTF;
@property (nonatomic,weak) TJ_CustomTextfield *passwordTF;
@property (nonatomic,weak) TJ_CustomTextfield *authCodeTF;
@property (nonatomic,weak) TJ_CustomButton *affirmBtn;

@end

@implementation TJ_RetrievePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupLayout];
}

- (void)setupUI {
    
    self.title = TJString(@"RetrievePasswordVCTitle");
    
    TJ_CustomTextfield *phoneNumberTF = [[TJ_CustomTextfield alloc]initWithPlaceholderString:TJString(@"phoneNumberTFPlaceholder") leftImagName:@"icon_user" rightImageName:nil];
    //    phoneNumberTF.backgroundColor = [UIColor lightGrayColor];
    phoneNumberTF.delegate = self;
    phoneNumberTF.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:phoneNumberTF];
    self.phoneNumberTF  = phoneNumberTF;
    
    TJ_CustomTextfield *passwordTF = [[TJ_CustomTextfield alloc]initWithPlaceholderString:TJString(@"newPasswordTFPlaceholder") leftImagName:@"icon_password" rightImageName:nil];
    //    passwordTF.backgroundColor = [UIColor lightGrayColor];
    passwordTF.delegate = self;
    [self.view addSubview:passwordTF];
    self.passwordTF  = passwordTF;
    
    TJ_CustomTextfield *authCodeTF = [[TJ_CustomTextfield alloc]initWithPlaceholderString:TJString(@"authCodeTFPlaceholder") leftImagName:@"icon_password" rightImageName:nil];
    //    passwordTF.backgroundColor = [UIColor lightGrayColor];
    authCodeTF.delegate = self;
    [self.view addSubview:authCodeTF];
    self.authCodeTF  = authCodeTF;
    [self.authCodeTF setCalculagraphForCountDown:60];
    
    TJ_CustomButton *affirmBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"logIn") titleColor:[UIColor whiteColor] backgroundColor:[UIColor orangeColor]];
    [affirmBtn addTarget:self action:@selector(affirmBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:affirmBtn];
    self.affirmBtn = affirmBtn;
    
    
}

- (void)setupLayout {
    
    __weak typeof(self) weakSelf = self;
    
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.top).offset((iPhoneX?88:64) + 100);
        make.height.equalTo(50);
        make.left.equalTo(weakSelf.view).offset(SPACE_1);
        make.right.equalTo(weakSelf.view).offset(-SPACE_1);
    }];
    [self.authCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordTF);
        make.top.equalTo(weakSelf.phoneNumberTF.bottom).offset(20);
        make.size.equalTo(weakSelf.passwordTF);
    }];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.phoneNumberTF);
        make.top.equalTo(weakSelf.authCodeTF.bottom).offset(20);
        make.size.equalTo(weakSelf.phoneNumberTF);
    }];
    
    [self.affirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordTF.bottom).offset(50);
        make.size.equalTo(CGSizeMake(100, 44));
        make.left.equalTo(weakSelf.view).offset(SPACE_1);
        make.right.equalTo(weakSelf.view).offset(-SPACE_1);
    }];
    
}


#pragma mark -------------------------- means ----------------------------------------
#pragma mark custom means


#pragma mark respond  menas
- (void)affirmBtnClicked:(TJ_CustomButton *)btn {
    
    
}


@end
