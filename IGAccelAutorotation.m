//
//  IGAccelAutorotation.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 24.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGAccelAutorotation.h"
#import "IGSettings.h"

#define kIGAccelAutorotationDataKey				@"kIGAccelAutorotationDataKey"

@implementation IGAccelAutorotation

/**
 Returns YES if given interface orientation is portrait
 
 @return BOOL
 */
+ (BOOL)allowPortrait:(UIInterfaceOrientation)io {
	//[IGSettingsUser setObject:io forKey:kIGAccelAutorotationDataKey];
	return (io == UIInterfaceOrientationPortrait);
}

/**
 Returns YES if given interface orientation is portrait or left
 
 @return BOOL
 */
+ (BOOL)allowPortraitLeft:(UIInterfaceOrientation)io {
	//[IGSettingsUser setObject:io forKey:kIGAccelAutorotationDataKey];
	return (io == UIInterfaceOrientationPortrait || io == UIInterfaceOrientationLandscapeLeft);
}


/**
 Returns YES if given interface orientation is portrait or right
 
 @return BOOL
 */
+ (BOOL)allowPortraitRight:(UIInterfaceOrientation)io {
	//[IGSettingsUser setObject:io forKey:kIGAccelAutorotationDataKey];
	return (io == UIInterfaceOrientationPortrait || io == UIInterfaceOrientationLandscapeRight);
}


/**
 Returns YES if given interface orientation is portrait, left or right
 
 @return BOOL
 */
+ (BOOL)allowPortraitLeftRight:(UIInterfaceOrientation)io {
	//[IGSettingsUser setObject:io forKey:kIGAccelAutorotationDataKey];
	return (io == UIInterfaceOrientationPortrait || io == UIInterfaceOrientationLandscapeLeft || io == UIInterfaceOrientationLandscapeRight);
}


/**
 Returns YES and doesnt mater what the orientation is ...
 Useful heh?! :)
 
 @return BOOL
 */
+ (BOOL)allowAll:(UIInterfaceOrientation)io {
	//[IGSettingsUser setObject:io forKey:kIGAccelAutorotationDataKey];
	return YES;
}

+ (UIInterfaceOrientation)getCurrentOrientation {
	//return [[UIDevice currentDevice] setOrientation:UIInterfaceOrientationPortrait];
	return UIInterfaceOrientationPortrait;
}


@end
