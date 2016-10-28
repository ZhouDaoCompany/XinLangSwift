//
//  UIColor+Helper.h
//  CPTN
//
//  Created by BST-Mars on 14-1-20.
//  Copyright (c) 2014年 Mars. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helper)

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue a:(CGFloat)alpha;
+ (UIColor *)colorWithW:(CGFloat)white a:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(int32_t)rgbValue;
+ (UIColor *)colorWithHex:(int32_t)rgbValue a:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)colorStr;
+ (UIColor *)colorWithHexString:(NSString *)colorStr alpha:(CGFloat)alpha;

+ (UIColor *)hexStringToColor:(NSString *)stringToConvert;
+ (UIColor *)colorWithHexNumber:(NSUInteger)hexColor;

@end
