//
//  IGNetworkingReachability.h
//  IGFramework
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>

typedef enum {
	NotReachable = 0,
	ReachableViaWiFi,
	ReachableViaWWAN
} NetworkStatus;

#define kIGNetworkingReachabilityChangedNotification @"kIGNetworkingReachabilityChangedNotification"


@interface IGNetworkingReachability : NSObject {
	
	BOOL localWiFiRef;
	SCNetworkReachabilityRef reachabilityRef;
	
}

//reachabilityWithHostName- Use to check the reachability of a particular host name. 
+ (IGNetworkingReachability *)reachabilityWithHostName: (NSString*) hostName;

//reachabilityWithAddress- Use to check the reachability of a particular IP address. 
+ (IGNetworkingReachability *)reachabilityWithAddress: (const struct sockaddr_in*) hostAddress;

//reachabilityForInternetConnection- checks whether the default route is available.  
//  Should be used by applications that do not connect to a particular host
+ (IGNetworkingReachability *)reachabilityForInternetConnection;

//reachabilityForLocalWiFi- checks whether a local wifi connection is available.
+ (IGNetworkingReachability *)reachabilityForLocalWiFi;

//Start listening for reachability notifications on the current run loop
- (BOOL) startNotifer;
- (void) stopNotifer;

- (NetworkStatus) currentReachabilityStatus;
//WWAN may be available, but not active until a connection has been established.
//WiFi may require a connection for VPN on Demand.
- (BOOL) connectionRequired;


@end
