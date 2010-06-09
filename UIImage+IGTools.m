//
//  UIImage-Tools.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 1.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "UIImage+IGTools.h"


@implementation UIImage (IGTools)

+ (UIImage *)imageNamed:(NSString *)name {
	NSLog(@"Image name: %@", name);
	NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
	return [UIImage imageWithContentsOfFile:path];
}


@end
