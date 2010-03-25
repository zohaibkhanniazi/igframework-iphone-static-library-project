//
//  IGAlertsBasic.h
//  iPinchMedia
//
//  Created by Ondrej Rafaj on 24.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IGAlertsBasic : NSObject {

}

@end

@protocol IGAlertsBasicDelegate

- (void)handleEnteredValue:(NSString *)value;

@optional

- (void)handleCancellation;

@end


@interface IGAlertsBasic : UIAlertView <UIAlertViewDelegate, UITextFieldDelegate> {
	
	UITextField *textField;
	
	id <IGAlertsBasicDelegate> caller;
	
	NSString *currentTitle;
	
	IGAlertsBasic *alert;
	
}


@property (nonatomic, retain) id <IGAlertsBasicDelegate> caller;


+ (void)showPopup:(NSString *)title withText:(NSString *)text;

- (NSString *)theText;

- (void)prepare;

- (void)makePassword;

- (void)makeTelephone;

- (void)showPopup;

- (void)initEmailAlertViewWithTitle:(NSString *)alertTitle initialPlaceholder:(NSString *)placeholder;
