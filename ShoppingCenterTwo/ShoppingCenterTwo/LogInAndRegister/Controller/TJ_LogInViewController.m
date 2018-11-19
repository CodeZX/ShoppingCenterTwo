//
//  LogInViewController.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_LogInViewController.h"
#import "TJ_CustomTextfield.h"
#import "TJ_CustomButton.h"
#import "TJ_CustomLabel.h"
#import "TJ_RegisterViewController.h"
#import "TJ_RetrievePasswordViewController.h"

@interface TJ_LogInViewController ()<UITextFieldDelegate>

@property (nonatomic,weak) TJ_CustomTextfield *phoneNumberTF;
@property (nonatomic,weak) TJ_CustomTextfield *passwordTF;
@property (nonatomic,weak) TJ_CustomButton *logInBtn;
@property (nonatomic,weak) TJ_CustomButton *forgetPasswordBtn;
@property (nonatomic,weak) TJ_CustomButton *registerBtn;
@end

@implementation TJ_LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self setupLayout];
}


- (void)setupUI {
    
    self.title = TJString(@"logIn");
    
    TJ_CustomTextfield *phoneNumberTF = [[TJ_CustomTextfield alloc]initWithPlaceholderString:TJString(@"phoneNumberTFPlaceholder") leftImagName:@"icon_user" rightImageName:nil];
//    phoneNumberTF.backgroundColor = [UIColor lightGrayColor];
    phoneNumberTF.delegate = self;
    phoneNumberTF.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:phoneNumberTF];
    self.phoneNumberTF  = phoneNumberTF;
    
    TJ_CustomTextfield *passwordTF = [[TJ_CustomTextfield alloc]initWithPlaceholderString:TJString(@"passwordTFPlaceholder") leftImagName:@"icon_password" rightImageName:nil];
//    passwordTF.backgroundColor = [UIColor lightGrayColor];
    passwordTF.delegate = self;
    [self.view addSubview:passwordTF];
    self.passwordTF  = passwordTF;
    
    TJ_CustomButton *logInBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"logIn") titleColor:[UIColor whiteColor] backgroundColor:[UIColor orangeColor]];
    [logInBtn addTarget:self action:@selector(logInBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logInBtn];
    self.logInBtn = logInBtn;
//    logInBtn.backgroundColor = [UIColor redColor];
    
    TJ_CustomButton *forgetPasswordBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"forgetPassword") titleColor:[UIColor orangeColor] titleFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor clearColor]];
    [forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPasswordBtn];
    self.forgetPasswordBtn = forgetPasswordBtn;
    
    
    TJ_CustomButton *registerBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"registerBtn") titleColor:[UIColor orangeColor] titleFont:[UIFont systemFontOfSize:12] backgroundColor:[UIColor clearColor]];
    [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
    
}

- (void)setupLayout {
 
    __weak typeof(self) weakSelf = self;
    
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.top).offset((iPhoneX?88:64) + 100);
        make.height.equalTo(50);
        make.left.equalTo(weakSelf.view).offset(SPACE_1);
        make.right.equalTo(weakSelf.view).offset(-SPACE_1);
    }];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.phoneNumberTF);
        make.top.equalTo(weakSelf.phoneNumberTF.bottom).offset(20);
        make.size.equalTo(weakSelf.phoneNumberTF);
    }];
    [self.logInBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.passwordTF.bottom).offset(50);
        make.size.equalTo(CGSizeMake(100, 44));
        make.left.equalTo(weakSelf.view).offset(SPACE_1);
        make.right.equalTo(weakSelf.view).offset(-SPACE_1);
    }];
    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.logInBtn.left);
        make.top.equalTo(weakSelf.logInBtn.bottom).offset(40);
        
    }];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.logInBtn.right);
        make.top.equalTo(weakSelf.logInBtn.bottom).offset(40);
    }];;
}
#pragma mark -------------------------- means ----------------------------------------
#pragma mark Custom means

- (void)networkLogIn {
    
    TJLog(@"登录请求、、、、");
    
}

#pragma mark respond means
- (void)logInBtnClicked:(TJ_CustomButton *)btn {
    
        if (![self.phoneNumberTF.text jk_isMobileNumberClassification])  {
            [MBProgressHUD showSuccess:TJString(@"phoneNumberError")];
        }else if (self.passwordTF.text.length < 0) {
            [MBProgressHUD showSuccess:TJString(@"passwordError")];
            return;
        }
        if ([self.phoneNumberTF.text jk_isMobileNumberClassification] && self.passwordTF.text.length > 0) {
            [self networkLogIn];
        }

    
}

- (void)forgetPasswordBtnClicked:(TJ_CustomButton *)btn {
    
    TJ_RetrievePasswordViewController *retrievePasswordVC = [[TJ_RetrievePasswordViewController alloc]init];
    [self.navigationController pushViewController:retrievePasswordVC animated:YES];
}

- (void)registerBtnClicked:(TJ_CustomButton *)btn {
  
    TJ_RegisterViewController *registerVC = [[TJ_RegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVC animated:YES];
    
}

@end
