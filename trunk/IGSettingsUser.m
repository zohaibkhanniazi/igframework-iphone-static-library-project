//
//  IGSettingsUser.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 1.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGSettingsUser.h"


@implementation IGSettingsUser


+ (void)setObject:(id)object forKey:(NSString *)key {
	if (object) {
		[[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}
}

+ (void)setString:(NSString *)object forKey:(NSString *)key {
	[self setObject:object forKey:key];
}

+ (void)setArray:(NSArray *)object forKey:(NSString *)key {
	[self setObject:object forKey:key];
}

+ (void)setDictionary:(NSDictionary *)object forKey:(NSString *)key {
	[self setObject:object forKey:key];
}

+ (id)getObjectForKey:(NSString *)key {
	return [[NSUserDefaults standardUserDefaults] objectForKey:key]; 
}

+ (NSString *)getStringForKey:(NSString *)key {
	NSString *ret = (NSString *)[self getObjectForKey:key];
	if (!ret) ret = [[[NSString alloc] init] autorelease];
	return ret;
}

+ (NSArray *)getArrayForKey:(NSString *)key {
	NSArray *ret = (NSArray *)[self getObjectForKey:key];
	if (!ret) ret = [[[NSArray alloc] init] autorelease];
	return ret;
}

+ (NSDictionary *)getDictionaryForKey:(NSString *)key {
	NSDictionary *ret = (NSDictionary *)[self getObjectForKey:key];
	if (!ret) ret = [[[NSDictionary alloc] init] autorelease];
	return ret;
}


@end
