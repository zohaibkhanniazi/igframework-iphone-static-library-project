//
//  IGUITextFieldCell.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 27.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGUITextFieldCell.h"


@implementation IGUITextFieldCell

@synthesize textField;


- (IGUITextFieldCell *)getCellWithText:(NSString *)myText andPlaceholder:(NSString *)placeholder {
	textField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 0.0, 280.0, 31.0)];
	textField.frame = CGRectMake(20.0, 0.0, 280.0, 31.0);
	textField.adjustsFontSizeToFitWidth = NO;
	textField.alpha = 1.000;
	textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
	textField.autocorrectionType = UITextAutocorrectionTypeDefault;
	textField.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
	textField.borderStyle = UITextBorderStyleNone;
	textField.clearsContextBeforeDrawing = YES;
	textField.clearsOnBeginEditing = NO;
	textField.clipsToBounds = YES;
	textField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
	textField.contentMode = UIViewContentModeScaleToFill;
	textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	textField.enabled = YES;
	textField.enablesReturnKeyAutomatically = NO;
	textField.font = [UIFont fontWithName:@"Helvetica" size:12.000];
	textField.hidden = NO;
	textField.highlighted = NO;
	textField.keyboardAppearance = UIKeyboardAppearanceDefault;
	textField.keyboardType = UIKeyboardTypeDefault;
	textField.minimumFontSize = 17.000;
	textField.multipleTouchEnabled = NO;
	textField.opaque = NO;
	textField.returnKeyType = UIReturnKeyDefault;
	textField.secureTextEntry = NO;
	textField.selected = NO;
	textField.tag = 0;
	textField.text = myText;
	textField.placeholder = placeholder;
	textField.textAlignment = UITextAlignmentLeft;
	textField.textColor = [UIColor colorWithWhite:0.000 alpha:1.000];
	textField.userInteractionEnabled = YES;
	
	IGUITextFieldCell *cell = [[IGUITextFieldCell alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 31.0) reuseIdentifier:nil];
	cell.frame = CGRectMake(0.0, 0.0, 320.0, 31.0);
	cell.accessoryType = UITableViewCellAccessoryNone;
	cell.alpha = 1.000;
	cell.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
	cell.backgroundColor = [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.000];
	cell.clearsContextBeforeDrawing = YES;
	cell.clipsToBounds = NO;
	cell.contentMode = UIViewContentModeScaleToFill;
	//cell.font = [UIFont fontWithName:@"Helvetica" size:17.000];
	cell.hidden = NO;
	//cell.hidesAccessoryWhenEditing = YES;
	cell.indentationLevel = 0;
	cell.indentationWidth = 10.000;
	//cell.lineBreakMode = UILineBreakModeTailTruncation;
	cell.multipleTouchEnabled = NO;
	cell.opaque = YES;
	//cell.selectedTextColor = [UIColor colorWithWhite:1.000 alpha:1.000];
	cell.selectionStyle = UITableViewCellSelectionStyleBlue;
	cell.showsReorderControl = NO;
	cell.tag = 0;
	//cell.textAlignment = UITextAlignmentLeft;
	//cell.textColor = [UIColor colorWithWhite:0.000 alpha:1.000];
	cell.userInteractionEnabled = YES;
	
	[cell addSubview:textField];
	
	return cell;
}

- (IGUITextFieldCell *)getCell {
	return [self getCellWithText:@"" andPlaceholder:@""];
}


- (void)dealloc {
	[textField release];
    [super dealloc];
}


@end
