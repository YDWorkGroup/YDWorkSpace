//
//  YDColor.h
//  TBKitFrameWork
//
//  Created by lowell on 22/5/16.
//  Copyright (c) 2016 lowell. All rights reserved.
//

#import <Foundation/Foundation.h>


#define  YDCOLOR_WHITE [UIColor whiteColor]
#define  YDCOLOR_BLACK [UIColor blackColor]
#define  YDCOLOR_BLUE [UIColor blueColor]


#define YDCOLOR_CLEARCOLOR [UIColor clearColor]


#define YDCOLOR_GREEN [UIColor greenColor]
#define YDCOLOR_RED [UIColor redColor]
#define YDCOLOR_GRAY [UIColor grayColor]
#define YDCOLOR_YELLOW [UIColor yellowColor]
#define YDCOLOR_LIGHTGRAY [UIColor lightGrayColor]

@interface YDColor : NSObject
//0x2d3f4a
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor opacity:(float)opacity;
//@"ffffff" or @"#ffffff"
+ (UIColor *)colorWithHexString:(NSString *)str;
+ (UIColor *)colorWithHexString:(NSString *)str opacity:(float)opacity;
@end
