//
//  IGNetworkingConnection.h
//  IGFramework
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IGNetworkingConnection : NSObject {

}

+ (BOOL)isWiFiConnectionAvailable;

+ (BOOL)isCellularConnectionAvailable;

+ (BOOL)isAnyConnectionAvailable;

@end
