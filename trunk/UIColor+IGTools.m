//
//  UIColor+IGTools.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 7.6.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "UIColor+IGTools.h"


@implementation UIColor (IGTools)

+ (CGFloat)getFrom:(CGFloat)value {
	//NSLog(@"From value:%f to: %f", value, (value / 255));
	return (value / 255);
}

+ (UIColor *)colorWithRealRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
	NSLog(@"Color red: %f green: %f blue: %f", [self getFrom:red], [self getFrom:green], [self getFrom:blue]);
	return [UIColor colorWithRed:[self getFrom:red] green:[self getFrom:green] blue:[self getFrom:blue] alpha:alpha];
}

- (UIColor *)colorWithRealRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
	return [UIColor colorWithRed:[UIColor getFrom:red] green:[UIColor getFrom:green] blue:[UIColor getFrom:blue] alpha:alpha];
}


@end
