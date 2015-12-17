//
//  UIColor+extension.m
//  originalVersion
//
//  Created by fish on 15/12/13.
//  Copyright © 2015年 fish. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "UIColor+extension.h"

@implementation UIColor (extension)

+ (UIColor *)defaultColor {
    return UIColorFromRGB(0xe73e20);
}

@end
