//
//  YBPersonalCenterVC.m
//  YBFreight
//
//  Created by lowell on 5/22/16.
//  Copyright © 2016 Y&D. All rights reserved.
//

#import "YBPersonalCenterVC.h"
#import "YBLoginVC.h"
@interface YBPersonalCenterVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableHeaderView;
@property (nonatomic, strong) UIButton *avatarBtn;
@property (nonatomic, strong) UIButton *userNameBtn;

- (UITableView *)tableView;
- (UIView *)tableHeaderView;

@end

@implementation YBPersonalCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)initUI {
    self.title = @"我的";
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.tableHeaderView = self.tableHeaderView;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 100)];
        
        UIView *userInfoBackView = [UIView new];
        [_tableHeaderView addSubview:userInfoBackView];
        
        [userInfoBackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.mas_equalTo(0);
            make.height.mas_equalTo(100);
            make.width.equalTo(_tableHeaderView.mas_width);
        }];
        
        self.avatarBtn  = [UIButton new];
        [userInfoBackView addSubview:self.avatarBtn];
        [self.avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(50);
            make.centerY.equalTo(userInfoBackView.mas_centerY);
            make.height.mas_equalTo(50);
            make.width.equalTo(self.avatarBtn.mas_height);
        }];
        
        self.avatarBtn.layer.cornerRadius = 25;
        self.avatarBtn.layer.masksToBounds = YES;
        
        [self.avatarBtn sd_setImageWithURL:[NSURL URLWithString:@"http://pic1.nipic.com/2008-12-09/200812910493588_2.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"icon_order_normal"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NSLog(@"%@", error);
        }];
        
        self.userNameBtn = [UIButton new];
        [userInfoBackView addSubview:self.userNameBtn];
        
        [self.userNameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.avatarBtn.mas_right).offset(30);
            make.top.mas_equalTo(0);
            make.height.equalTo(userInfoBackView.mas_height);
            make.width.mas_equalTo(100);
        }];
        [self.userNameBtn setTitle:@"点击登录" forState:UIControlStateNormal];
        [self.userNameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.userNameBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tableHeaderView;
}

- (void)login:(id)sender {
    YBLoginVC *vc = [YBLoginVC new];
    [YBAppInstance.appDelegate.rootNavigationController pushViewController:vc animated:YES];
}

#pragma mark ----------------------   UITableView delegate & dataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
