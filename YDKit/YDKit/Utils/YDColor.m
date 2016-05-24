//
//  YDColor.h
//  TBKitFrameWork
//
//  Created by lowell on 22/5/16.
//  Copyright (c) 2016 lowell. All rights reserved.
//

#import "YDColor.h"

#define DEFAULT_VOID_COLOR [UIColor blackColor]


#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation YDColor


+ (UIColor *)colorWithHex:(long)hexColor {
    return [YDColor colorWithHex:hexColor opacity:1.];
}

+ (UIColor *)colorWithHex:(long)hexColor opacity:(float)opacity {
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+ (UIColor *)colorWithHexString:(NSString *)str opacity:(float)opacity {
    if (str.length < 6) {
        return nil;
    }
    NSInteger delta = 0;
    if ([str hasPrefix:@"#"]) {
        delta = 1;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 0 + delta;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 2 + delta;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 4 + delta;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:opacity];
    return color;
}

+ (UIColor *)colorWithHexString:(NSString *)str
{
    return[YDColor colorWithHexString:str opacity:1.];
}

@end
