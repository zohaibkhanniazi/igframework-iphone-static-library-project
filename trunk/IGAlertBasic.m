//
//  IGAlertBasic.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 26.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGAlertBasic.h"


@implementation IGAlertBasic

/**
 Shows basic UIAlertView dialog with specified title, message and Ok button
 
 @param popupTitle NSString Title of the popup window
 @param popupText NSString Message body of the popup window
 */
+ (void)showPopup:(NSString *)popupTitle withText:(NSString *)popupText {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:popupTitle message:popupText delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}


@end
