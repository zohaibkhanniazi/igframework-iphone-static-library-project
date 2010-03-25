//
//  IGAccelAutorotation.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 24.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGAccelAutorotation.h"


@implementation IGAccelAutorotation

+ (BOOL)allowPortrait:(UIInterfaceOrientation)io {
	return (io == UIInterfaceOrientationPortrait);
}

+ (BOOL)allowPortraitLeft:(UIInterfaceOrientation)io {
	return (io == UIInterfaceOrientationPortrait || io == UIInterfaceOrientationLandscapeLeft);
}


+ (BOOL)allowPortraitRight:(UIInterfaceOrientation)io {
	return (io == UIInterfaceOrientationPortrait || io == UIInterfaceOrientationLandscapeRight);
}


+ (BOOL)allowPortraitLeftRight:(UIInterfaceOrientation)io {
	return (io == UIInterfaceOrientationPortrait || io == UIInterfaceOrientationLandscapeLeft || io == UIInterfaceOrientationLandscapeRight);
}


+ (BOOL)allowAll:(UIInterfaceOrientation)io {
	return YES;
}



@end
