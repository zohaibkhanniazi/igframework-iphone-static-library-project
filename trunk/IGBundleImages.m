//
//  IGBundleImages.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 25.5.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGBundleImages.h"


@implementation IGBundleImages

+ (UIImage *)imageNamed:(NSString *)imageName {
	NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
	return [UIImage imageWithContentsOfFile:path];
}


@end
