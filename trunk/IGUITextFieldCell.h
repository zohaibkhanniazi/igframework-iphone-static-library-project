//
//  IGUITextFieldCell.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 27.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IGUITextFieldCell : UITableViewCell {
	
	IBOutlet UITextField *textField;
	
}

@property (nonatomic, retain) IBOutlet UITextField *textField;


- (IGUITextFieldCell *)getCellWithText:(NSString *)myText andPlaceholder:(NSString *)placeholder;

- (IGUITextFieldCell *)getCell;


@end
