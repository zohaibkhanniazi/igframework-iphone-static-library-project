//
//  IGNetworkingConnection.m
//  IGFramework
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGNetworkingConnection.h"
#import "IGNetworkingReachability.h"

@implementation IGNetworkingConnection


/**
 Checks if the device is connected to the WiFi
 
 @return BOOL
 */
+ (BOOL)isWiFiConnectionAvailable {
	IGNetworkingReachability *internetReach = [[[IGNetworkingReachability reachabilityForInternetConnection] retain] autorelease];
	if([internetReach currentReachabilityStatus] == ReachableViaWiFi) return YES;
	else return NO;
}

/**
 Checks if the device is reachable on the cellular network
 
 @return BOOL
 */
+ (BOOL)isCellularConnectionAvailable {
	IGNetworkingReachability* internetReach = [[[IGNetworkingReachability reachabilityForInternetConnection] retain] autorelease];
	if([internetReach currentReachabilityStatus] == ReachableViaWWAN) return YES;
	else return NO;
}


/**
 Checks if the device is reachable
 
 @return BOOL
 */
+ (BOOL)isAnyConnectionAvailable {
	IGNetworkingReachability* internetReach = [[[IGNetworkingReachability reachabilityForInternetConnection] retain] autorelease];
	if([internetReach currentReachabilityStatus] != NotReachable) return YES;
	else return NO;
}



@end
