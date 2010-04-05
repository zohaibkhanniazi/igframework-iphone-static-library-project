///
///  IGGoogleAPIMaps.h
///
///  IGFramework
///
///  Created by Ondrej Rafaj on 22.3.10.
///
///  Copyright 2010 Home. All rights reserved.
///

#import <Foundation/Foundation.h>


@interface IGGoogleAPIMaps : NSObject {

}

+ (NSString *)getMapsApiUrl:(NSString *)query;

+ (NSDictionary *)getLocationDataFor:(NSString *)query;

+ (NSDictionary *)getBasicLocationDataFor:(NSString *)query;


@end
