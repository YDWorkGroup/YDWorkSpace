//
//  YBApp.m
//  YBFreight
//
//  Created by lowell on 5/22/16.
//  Copyright © 2016 Y&D. All rights reserved.
//

#import "YBApp.h"

@implementation YBApp

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YBApp *app;
    dispatch_once(&onceToken, ^{
        app = [YBApp new];
        app.themeColor = [UIColor colorWithRed:241.0/255.0 green:160.0/255.0 blue:60.0/255.0 alpha:1.0];
        [[UINavigationBar appearance] setBarTintColor:app.themeColor];
    });
    return app;
}

- (void)registerAppdelegate:(AppDelegate *)appdelegate {
    _appDelegate = appdelegate;
}

@end
