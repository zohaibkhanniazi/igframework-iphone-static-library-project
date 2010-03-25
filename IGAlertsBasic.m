//
//  IGAlertsBasic.m
//  iPinchMedia
//
//  Created by Ondrej Rafaj on 24.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGAlertsBasic.h"


@implementation IGAlertsBasic

@synthesize caller;

#pragma mark Delegate callbacks
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ([[alertView title] isEqualToString:currentTitle]) { //Only for one specific alert
		NSString *myString = [textField text]; //Get the string
		if ([myString length] <= 0 || buttonIndex ==0) [self.caller handleCancellation]; //If cancel or 0 length string the string doesn't matter
		if (buttonIndex == 1) [self.caller handleEnteredValue:myString];
		NSLog(@"IGAlertsBasic: %@", myString);
	}
}

#pragma mark Handling functions

- (NSString *)theText {
	return @"";
}

- (void)prepare {
	
}

- (void)makePassword {
	
}

- (void)makeTelephone {
	
}

#pragma mark Popus

+ (void)showPopup:(NSString *)popupTitle withText:(NSString *)popupText {
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[WGLocalization get:popupTitle] message:[WGLocalization get:popupText] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
}

- (void)showPopup {
	[alert show];
}

- (void)initEmailAlertViewWithTitle:(NSString *)alertTitle initialPlaceholder:(NSString *)placeholder {
	currentTitle = alertTitle;
	alert = [[UIAlertView alloc] initWithTitle:alertTitle message:@"                                         " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
	CGRect frame = CGRectMake(12.0, 45.0, 260.0, 25.0);
	textField = [[[UITextField alloc] initWithFrame:frame] autorelease];
	textField.borderStyle = UITextBorderStyleBezel;
	textField.textColor = [UIColor blackColor];
	textField.textAlignment = UITextAlignmentCenter;
	textField.font = [UIFont systemFontOfSize:14.0];
	textField.placeholder = placeholder;
	textField.backgroundColor = [UIColor whiteColor];
	textField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
	textField.keyboardType = UIKeyboardTypeEmailAddress; // use the default type input method (entire keyboard)
	textField.returnKeyType = UIReturnKeyDone;
	textField.clearButtonMode = UITextFieldViewModeWhileEditing; // has a clear 'x' button to the right
	textField.delegate = self;
	[alert addSubview:textField];
	alert.transform = CGAffineTransformTranslate(alert.transform, 0.0, 100.0 );
	[textField becomeFirstResponder];
	alert.delegate = self;
	//return alert;
}

- (void)dealloc {
	[textField, alert release];
	[super dealloc];
}



@end
