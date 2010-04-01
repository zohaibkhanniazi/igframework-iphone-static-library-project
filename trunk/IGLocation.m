//
//  IGLocation.m
//  IGFramework
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGLocation.h"


@implementation IGLocation

/**
 Returns location info of the device
 
 @todo: Make this work
 
 @return NSDictionary Location info
 */ 
+ (NSDictionary *)getLocationInfo {
	NSMutableDictionary *ret = [[[NSMutableDictionary alloc] init] autorelease];
	[ret setObject:@"0.54555455" forKey:@"longitude"];
	[ret setObject:@"0.54555455" forKey:@"latitude"];
	[ret setObject:@"127" forKey:@"altitude"];
	[ret setObject:@"0.0" forKey:@"speed"];
	[ret setObject:@"mps" forKey:@"speedunit"];
	[ret setObject:@"-1.0" forKey:@"course"];
	[ret setObject:[NSDate date] forKey:@"date"];
	[ret setObject:@"0.54555455" forKey:@"updated"];
	[ret setObject:@"56.8" forKey:@"accuracy"];
	return (NSDictionary *)ret;
}





@end
