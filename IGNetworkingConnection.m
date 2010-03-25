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

+ (BOOL)isWiFiConnectionAvailable {
	IGNetworkingReachability *internetReach = [[[IGNetworkingReachability reachabilityForInternetConnection] retain] autorelease];
	if([internetReach currentReachabilityStatus] == ReachableViaWiFi) return YES;
	else return NO;
}

+ (BOOL)isCellularConnectionAvailable {
	IGNetworkingReachability* internetReach = [[[IGNetworkingReachability reachabilityForInternetConnection] retain] autorelease];
	if([internetReach currentReachabilityStatus] == ReachableViaWWAN) return YES;
	else return NO;
}


+ (BOOL)isAnyConnectionAvailable {
	IGNetworkingReachability* internetReach = [[[IGNetworkingReachability reachabilityForInternetConnection] retain] autorelease];
	if([internetReach currentReachabilityStatus] != NotReachable) return YES;
	else return NO;
}



@end
