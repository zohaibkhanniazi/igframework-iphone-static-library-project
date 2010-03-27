//
//  IGUILabelCell.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 27.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGUILabelCell.h"


@implementation IGUILabelCell

@synthesize cellLabel;



- (IGUILabelCell *)getCell {
	return [self getCellWithTitle:@""];
}

- (IGUILabelCell *)getCellWithTitle:(NSString *)title {
	self.cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 0.0, 280.0, 25.0)];
	//self.cellLabel.frame = CGRectMake(20.0, 0.0, 280.0, 44.0);
	self.cellLabel.adjustsFontSizeToFitWidth = YES;
	self.cellLabel.alpha = 1.000;
	self.cellLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin;
	self.cellLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
	self.cellLabel.clearsContextBeforeDrawing = YES;
	self.cellLabel.clipsToBounds = YES;
	self.cellLabel.contentMode = UIViewContentModeLeft;
	//self.cellLabel.enabled = YES;
	self.cellLabel.font = [UIFont fontWithName:@"Helvetica" size:17.000];
	self.cellLabel.hidden = NO;
	self.cellLabel.lineBreakMode = UILineBreakModeTailTruncation;
	self.cellLabel.minimumFontSize = 10.000;
	self.cellLabel.multipleTouchEnabled = NO;
	self.cellLabel.numberOfLines = 1;
	self.cellLabel.opaque = NO;
	self.cellLabel.shadowOffset = CGSizeMake(0.0, -1.0);
	self.cellLabel.tag = 0;
	self.cellLabel.text = title;
	self.cellLabel.textAlignment = UITextAlignmentLeft;
	self.cellLabel.textColor = [UIColor colorWithRed:0.000 green:0.000 blue:0.000 alpha:1.000];
	self.cellLabel.userInteractionEnabled = NO;
	
	IGUILabelCell *cell = [[IGUILabelCell alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0) reuseIdentifier:nil];
	//cell.frame = CGRectMake(0.0, 0.0, 320.0, 44.0);
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
	
	[cell addSubview:self.cellLabel];
	return cell;
}

- (void)dealloc {
	[cellLabel release];
    [super dealloc];
}


@end
