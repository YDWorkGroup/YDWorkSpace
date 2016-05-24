//
//  YBRegisterVC.m
//  YBFreight
//
//  Created by 胡丹 on 16/5/22.
//  Copyright © 2016年 Y&D. All rights reserved.
//

#import "YBRegisterVC.h"

#define kMargin 30
#define kControlHeight 40

@interface YBRegisterVC ()

@property (nonatomic, strong) UITextField *phoneNumTextField;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *checkCodeTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UIButton *getCodeButton;
@property (nonatomic, strong) UIButton *registerButton;
@end

@implementation YBRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI
{
    self.view.backgroundColor = YDCOLOR_WHITE;
    // 顶部
    UIView *topView = [[UIView alloc] init];
    [topView setBackgroundColor:YBAppInstance.themeColor];
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(20);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(@44);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:@"司机注册"];
    [titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [topView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_top);
        make.left.equalTo(topView.mas_left);
        make.right.equalTo(topView.mas_right);
        make.bottom.equalTo(topView.mas_bottom);
    }];
    
    // 手机号码
    [self.view addSubview:self.phoneNumTextField];
    [self.phoneNumTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).offset(30);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.height.mas_equalTo(kControlHeight);
    }];
    
    // 真实姓名
    [self.view addSubview:self.nameTextField];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneNumTextField.mas_bottom).offset(kMargin);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.height.mas_equalTo(kControlHeight);
    }];
    
    // 验证码
    [self.view addSubview:self.checkCodeTextField];
    [self.checkCodeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextField.mas_bottom).offset(kMargin/2);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.right.equalTo(self.view.mas_right).offset(-kMargin - (100 + 3));
        make.height.mas_equalTo(kControlHeight);
    }];
    
    // 获取验证码
    [self.view addSubview:self.getCodeButton];
    [self.getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.checkCodeTextField.mas_top);
        make.left.equalTo(self.checkCodeTextField.mas_right).offset(3);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.height.mas_equalTo(kControlHeight);
    }];
    
    // 密码
    [self.view addSubview:self.passwordTextField];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.checkCodeTextField.mas_bottom).offset(kMargin/2);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.height.mas_equalTo(kControlHeight);
    }];
    
    // 注册
    [self.view addSubview:self.registerButton];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(kMargin/2);
        make.left.equalTo(self.view.mas_left).offset(kMargin);
        make.right.equalTo(self.view.mas_right).offset(-kMargin);
        make.height.mas_equalTo(kControlHeight);
    }];
}

#pragma mark Getter
- (UITextField *)phoneNumTextField
{
    if (!_phoneNumTextField) {
        _phoneNumTextField = [self textFieldWithPlacehoder:@"手机号码"];
    }
    return _phoneNumTextField;
}

- (UITextField *)nameTextField
{
    if (!_nameTextField) {
        _nameTextField = [self textFieldWithPlacehoder:@"真实姓名"];
    }
    return _nameTextField;
}

- (UITextField *)checkCodeTextField
{
    if (!_checkCodeTextField) {
        _checkCodeTextField = [self textFieldWithPlacehoder:@"验证码"];
    }
    return _checkCodeTextField;
}

- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [self textFieldWithPlacehoder:@"密码"];;
    }
    return _passwordTextField;
}

- (UIButton *)getCodeButton
{
    if (!_getCodeButton) {
        _getCodeButton = [self buttonWithTitle:@"获取验证码"];
    }
    return _getCodeButton;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        _registerButton = [self buttonWithTitle:@"注册"];
    }
    return _registerButton;
}

#pragma mark - create control

- (UIButton *)buttonWithTitle:(NSString *)btnTitle
{
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.backgroundColor = YBAppInstance.themeColor;
    [button setTitle:btnTitle forState:UIControlStateNormal];
    
    return button;
}

- (UITextField *)textFieldWithPlacehoder:(NSString *)text
{
    UITextField *textField = [[UITextField alloc] init];
    [textField setPlaceholder:text];
    [textField setFont:[UIFont systemFontOfSize:15.f]];
    
    textField.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    textField.layer.borderWidth = 1.f;
    textField.layer.cornerRadius = 13.f;
    return textField;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
