//
//  IGGoogleAPIMaps.m
//  IGFramework
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGGoogleAPIMaps.h"
#import "IGConfiguration.h"
#import "NSString+URL.h"
#import "IGJsonData.h"


@implementation IGGoogleAPIMaps


+ (NSDictionary *)getCountryCoordinates:(NSString *)countryName useCache:(BOOL)cache {
	/*NSString *path = @"";
	NSMutableDictionary *dic = nil;
	if ([countryName isEqualToString:@"Educational"] || [countryName isEqualToString:@"Organizations"] || [countryName isEqualToString:@"Networks"] || [countryName isEqualToString:@"Numeric"] || [countryName isEqualToString:@"Commercial"] || [countryName isEqualToString:@"Unknown"]) return nil;
	if ([countryName isEqualToString:@"Serbia and Montenegro"]) countryName = @"Serbia";
	if (cache || [wgIo isFile:path]) dic = [[[NSMutableDictionary alloc] initWithContentsOfFile:path] autorelease];
	else dic = [[[NSMutableDictionary alloc] init] autorelease];
	if ([dic objectForKey:countryName]) return [dic objectForKey:countryName];
	else {
		NSDictionary *d = [wgGeoLocation getLocationDataFromGoogle:countryName];
		if (d) [dic setObject:d forKey:countryName];
		else NSLog(@"Error: %@", d);
		[dic writeToFile:path atomically:YES];
		return d;
	}*/
	return nil;
}

+ (NSString *)getMapsApiUrl:(NSString *)query {
	return [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=json&key=%@", query, kIGGoogleAPIMapsKey];
}

// TODO: make it type specific
+ (NSDictionary *)getLocationDataFor:(NSString *)query {
	NSString *s = [[self getMapsApiUrl:query] contentOfStringURLInUtf8];
	NSDictionary *chunks = [IGJsonData getDataFromString:s];
	return chunks;
}

+ (NSDictionary *)getBasicLocationDataFor:(NSString *)query {
	NSString *s = [[self getMapsApiUrl:query] contentOfStringURLInUtf8];
	NSMutableDictionary *chunks = (NSMutableDictionary *)[IGJsonData getDataFromString:s];
	NSMutableDictionary *d = [[[NSMutableDictionary alloc] init] autorelease];
	NSDictionary *p = (NSDictionary *)[[chunks objectForKey:@"Placemark"] objectAtIndex:0];
	if ([[p objectForKey:@"AddressDetails"] objectForKey:@"Country"] != nil) {
		[d setObject:[[chunks objectForKey:@"Status"] objectForKey:@"code"] forKey:@"code"];
		[d setObject:[[p objectForKey:@"AddressDetails"] objectForKey:@"Country"] forKey:@"country"];
		[d setObject:[[p objectForKey:@"AddressDetails"] objectForKey:@"Accuracy"] forKey:@"accuracy"];
		[d setObject:[NSString stringWithFormat:@"%@", [[[p objectForKey:@"Point"] objectForKey:@"coordinates"] objectAtIndex:0]] forKey:@"longitude"];
		[d setObject:[NSString stringWithFormat:@"%@", [[[p objectForKey:@"Point"] objectForKey:@"coordinates"] objectAtIndex:1]] forKey:@"latitude"];
		[d setObject:[[p objectForKey:@"ExtendedData"] objectForKey:@"LatLonBox"] forKey:@"box"];
		return d;
	}
	else return nil;
}




@end
