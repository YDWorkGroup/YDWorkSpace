//
//  YBLoginVC.m
//  YBFreight
//
//  Created by lowell on 5/22/16.
//  Copyright © 2016 Y&D. All rights reserved.
//

#import "YBLoginVC.h"
#import "YBRegisterVC.h"

@interface YBLoginVC ()

@property (nonatomic, strong) UITextField *userNameField;
@property (nonatomic, strong) UITextField *pwdField;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *forgetBtn;

@end

@implementation YBLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"司机登录";
    self.userNameField = [UITextField new];
    [self.view addSubview:self.userNameField];
    [self.userNameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.height.mas_equalTo(45);
        make.top.mas_equalTo(kNavBarHeight + 30);
    }];
    self.userNameField.placeholder = @"手机号码";
    self.userNameField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.pwdField = [UITextField new];
    self.pwdField.borderStyle = UITextBorderStyleRoundedRect;
    self.pwdField.placeholder = @"密码";
    self.pwdField.secureTextEntry = YES;
    [self.view addSubview:self.pwdField];
    [self.pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userNameField);
        make.right.equalTo(self.userNameField);
        make.height.equalTo(self.userNameField);
        make.top.equalTo(self.userNameField.mas_bottom).offset(15);
    }];
    
    self.loginBtn = [UIButton new];
    [self.view addSubview:self.loginBtn];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.width.equalTo(self.pwdField);
        make.top.equalTo(self.pwdField.mas_bottom).offset(15);
        make.height.mas_offset(45);
    }];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = YBAppInstance.themeColor;
    
    self.registerBtn = [UIButton new];
    [self.view addSubview:self.registerBtn];
    
    [self.registerBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginBtn);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];
    [self.registerBtn setTitle:@"新用户注册！" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:YDCOLOR_GRAY forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.registerBtn sizeToFit];
    
    [self.registerBtn addTarget:self action:@selector(userRegister:) forControlEvents:UIControlEventTouchUpInside];
    
    self.forgetBtn = [UIButton new];
    [self.view addSubview:self.forgetBtn];
    
    [self.forgetBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loginBtn);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];
    [self.forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.forgetBtn setTitleColor:YDCOLOR_LIGHTGRAY forState:UIControlStateNormal];
    self.forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.forgetBtn sizeToFit];
}

- (void)userRegister:(id)sender {
    YBRegisterVC *vc = [YBRegisterVC new];
    [YBAppInstance.appDelegate.rootNavigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
