//
//  TJ_RegisterViewController.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_RegisterViewController.h"
#import "TJ_CustomTextfield.h"
#import "TJ_CustomButton.h"
#import "TJ_CustomLabel.h"
#import "TJ_ClauseViewController.h"
#import "TJ_RetrievePasswordViewController.h"

@interface TJ_RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic,weak) TJ_CustomTextfield *phoneNumberTF;
@property (nonatomic,weak) TJ_CustomTextfield *passwordTF;
@property (nonatomic,weak) TJ_CustomTextfield *authCodeTF;
@property (nonatomic,weak) TJ_CustomButton *registerBtn;
@property (nonatomic,weak) TJ_CustomButton *clauseSelectBtn;
@property (nonatomic,weak) TJ_CustomLabel *clauseLB;
@end

@implementation TJ_RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setupLayout];
}

- (void)setupUI {

    self.title = TJString(@"Register");
    
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
    
    TJ_CustomTextfield *authCodeTF = [[TJ_CustomTextfield alloc]initWithPlaceholderString:TJString(@"authCodeTFPlaceholder") leftImagName:@"icon_password" rightImageName:nil];
    //    passwordTF.backgroundColor = [UIColor lightGrayColor];
    authCodeTF.delegate = self;
    [self.view addSubview:authCodeTF];
    self.authCodeTF  = authCodeTF;
    [self.authCodeTF setCalculagraphForCountDown:60];
    
    TJ_CustomButton *registerBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"logIn") titleColor:[UIColor whiteColor] backgroundColor:[UIColor orangeColor]];
    [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    self.registerBtn = registerBtn;
    
    
    TJ_CustomButton *clauseSelectBtn = [[TJ_CustomButton alloc]initWithTitle:nil titleColor:nil titleFont:nil imageName:@"" selectImageName:@"" backgroundColor:[UIColor redColor]];
    [clauseSelectBtn addTarget:self action:@selector(clauseSelectBtnClicked:) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview:clauseSelectBtn];
    self.clauseSelectBtn = clauseSelectBtn;
    
    
    TJ_CustomLabel *clauseLB = [[TJ_CustomLabel alloc]initWithTitle:TJString(@"clause") titleColor: [UIColor blueColor]];
    [self.view addSubview:clauseLB];
    self.clauseLB = clauseLB;
    self.clauseLB.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clauseLB:)];
    [self.clauseLB addGestureRecognizer:tap];
    //    logInBtn.backgroundColor = [UIColor redColor];
    
//    TJ_CustomButton *forgetPasswordBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"forgetPassword") titleColor:[UIColor orangeColor] backgroundColor:[UIColor clearColor]];
//    [forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:forgetPasswordBtn];
//    self.forgetPasswordBtn = forgetPasswordBtn;
//
//
//    TJ_CustomButton *registerBtn = [[TJ_CustomButton alloc]initWithTitle:TJString(@"registerBtn") titleColor:[UIColor orangeColor] backgroundColor:[UIColor clearColor]];
//    [registerBtn addTarget:self action:@selector(registerBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:registerBtn];
//    self.registerBtn = registerBtn;
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
    [self.authCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.passwordTF);
        make.top.equalTo(weakSelf.passwordTF.bottom).offset(20);
        make.size.equalTo(weakSelf.passwordTF);
    }];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.authCodeTF.bottom).offset(50);
        make.size.equalTo(CGSizeMake(100, 44));
        make.left.equalTo(weakSelf.view).offset(SPACE_1);
        make.right.equalTo(weakSelf.view).offset(-SPACE_1);
    }];
    
    [self.clauseSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.registerBtn.left).offset(20);
        make.right.equalTo(weakSelf.clauseLB.left).offset(-10);
        make.centerY.equalTo(weakSelf.clauseLB);
        make.size.equalTo(CGSizeMake(15, 15));
    }];
    
    [self.clauseLB mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.clauseSelectBtn.right).offset(20);
        make.top.equalTo(weakSelf.registerBtn.bottom).offset(20);
        make.centerX.equalTo(weakSelf.view);
    }];
//    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.logInBtn.left);
//        make.top.equalTo(weakSelf.logInBtn.bottom).offset(40);
//
//    }];
//    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(weakSelf.logInBtn.right);
//        make.top.equalTo(weakSelf.logInBtn.bottom).offset(40);
//    }];;
}



#pragma mark -------------------------- means ----------------------------------------
#pragma mark custom means


#pragma mark respond  menas

- (void)registerBtnClicked:(TJ_CustomButton *)btn {
    
    
}

- (void)clauseLB:(UITapGestureRecognizer *)tap {
    
    TJ_ClauseViewController *clauseVC= [[TJ_ClauseViewController alloc]init];
    [self.navigationController pushViewController:clauseVC animated:YES];
    
}

- (void)clauseSelectBtnClicked:(TJ_CustomButton *)btn {
    
    btn.selected = !btn.selected;
    
}

@end
