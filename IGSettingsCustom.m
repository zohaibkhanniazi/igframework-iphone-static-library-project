//
//  IGSettingsCustom.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 1.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGSettingsCustom.h"
#import "IGFilesystemPaths.h"
#import "IGFilesystemIO.h"


@implementation IGSettingsCustom

@synthesize internalIdentifier, data;

+ (NSString *)getPath:(NSString *)identifier {
	return [NSString stringWithFormat:@"%@%@.settings", [IGFilesystemPaths getSystemDirectoryPath], identifier];
}

- (IGSettingsCustom *)initWithIdentifier:(NSString *)identifier {
	if (identifier && [identifier length] > 0) self.internalIdentifier = identifier;
	else return nil;
	NSString *path = [IGSettingsCustom getPath:identifier];
	if ([IGFilesystemIO isFile:path]) self.data = [[NSDictionary alloc] initWithContentsOfFile:path];
	else {
		self.data = [[NSMutableDictionary alloc] init];
		[self.data setValue:[[[NSMutableDictionary alloc] init] autorelease] forKey:@"data"];
	}
	return self;
}

- (void)synchronize {
	NSString *path = [IGSettingsCustom getPath:self.internalIdentifier];
	[self.data writeToFile:path atomically:YES];
}

- (void)setObject:(id)object forKey:(NSString *)key {
	[[self.data objectForKey:@"data"] setValue:object forKey:key];
}

- (void)setString:(NSString *)object forKey:(NSString *)key {
	[self setObject:object forKey:key];
}

- (void)setArray:(NSArray *)object forKey:(NSString *)key {
	[self setObject:object forKey:key];
}

- (void)setDictionary:(NSDictionary *)object forKey:(NSString *)key {
	[self setObject:object forKey:key];
}

- (id)getObjectForKey:(NSString *)key {
	return [[self.data objectForKey:@"data"] objectForKey:key];
}

- (NSString *)getStringForKey:(NSString *)key {
	NSString *ret = (NSString *)[self getObjectForKey:key];
	if (!ret) ret = [[[NSString alloc] init] autorelease];
	return ret;
}

- (NSArray *)getArrayForKey:(NSString *)key {
	NSArray *ret = (NSArray *)[self getObjectForKey:key];
	if (!ret) ret = [[[NSArray alloc] init] autorelease];
	return ret;
}

- (NSDictionary *)getDictionaryForKey:(NSString *)key {
	NSDictionary *ret = (NSDictionary *)[self getObjectForKey:key];
	if (!ret) ret = [[[NSDictionary alloc] init] autorelease];
	return ret;
}

+ (void)setObject:(id)object forKey:(NSString *)key withIdentifier:(NSString *)identifier {
	IGSettingsCustom *s = [[[IGSettingsCustom alloc] initWithIdentifier:identifier] autorelease];
	[s setObject:object forKey:key];
	[s synchronize];
}

+ (void)setString:(NSString *)object forKey:(NSString *)key withIdentifier:(NSString *)identifier {
	[self setObject:object forKey:key withIdentifier:identifier];
}

+ (void)setArray:(NSArray *)object forKey:(NSString *)key withIdentifier:(NSString *)identifier {
	[self setObject:object forKey:key withIdentifier:identifier];
}

+ (void)setDictionary:(NSDictionary *)object forKey:(NSString *)key withIdentifier:(NSString *)identifier {
	[self setObject:object forKey:key withIdentifier:identifier];
}

+ (id)getObjectForKey:(NSString *)key withIdentifier:(NSString *)identifier {
	NSString *ret = (NSString *)[self getObjectForKey:key withIdentifier:identifier];
	if (!ret) ret = [[[NSString alloc] init] autorelease];
	return ret;
}

+ (NSString *)getStringForKey:(NSString *)key withIdentifier:(NSString *)identifier {
	NSString *ret = (NSString *)[self getObjectForKey:key withIdentifier:identifier];
	if (!ret) ret = [[[NSString alloc] init] autorelease];
	return ret;
}

+ (NSArray *)getArrayForKey:(NSString *)key withIdentifier:(NSString *)identifier {
	NSArray *ret = (NSArray *)[self getObjectForKey:key withIdentifier:identifier];
	if (!ret) ret = [[[NSArray alloc] init] autorelease];
	return ret;
}

+ (NSDictionary *)getDictionaryForKey:(NSString *)key withIdentifier:(NSString *)identifier {
	NSDictionary *ret = (NSDictionary *)[self getObjectForKey:key withIdentifier:identifier];
	if (!ret) ret = [[[NSDictionary alloc] init] autorelease];
	return ret;
}

- (void)dealloc {
	[internalIdentifier, data release];
	[super dealloc];
}


@end
