//
//  IGUILabelCell.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 27.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface IGUILabelCell : UITableViewCell {
	
	IBOutlet UILabel *cellLabel;
	
}

@property (nonatomic, retain) IBOutlet UILabel *cellLabel;

- (IGUILabelCell *)getCell;

- (IGUILabelCell *)getCellWithTitle:(NSString *)title;


@end
