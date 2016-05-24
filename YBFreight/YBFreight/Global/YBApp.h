//
//  YBApp.h
//  YBFreight
//
//  Created by lowell on 5/22/16.
//  Copyright © 2016 Y&D. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

#define YBAppInstance [YBApp sharedInstance]

@interface YBApp : NSObject

+ (instancetype)sharedInstance;
- (void)registerAppdelegate:(AppDelegate *)appdelegate;

@property (nonatomic, weak, readonly) AppDelegate *appDelegate;
@property (nonatomic, strong) UIColor *themeColor;

@end
