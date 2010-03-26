//
//  IGSimpleDB.m
//  iBBClone
//
//  Created by Ondrej Rafaj on 21.2.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGSimpleDB.h"
#import "IGFilesystemIO.h"
#import "IGFilesystemPaths.h"


@implementation IGSimpleDB

// public; returns id from given object
+ (int)getId:(NSDictionary *)item {
	return [[item objectForKey:kIGSimpleDBMainIdKey] intValue];
}

// private; converts number to number in the string
+ (NSString *)_encodeNumber:(int)num {
	return [NSString stringWithFormat:@"%d", num];
}

// private; returns path to the documents/db folder
+ (NSString *)_getPathToDb:(NSString *)dbName {
	NSString *p = [NSString stringWithFormat:@"%@%@/", [IGFilesystemPaths getDatabaseDirectoryPath], kIGSimpleDBFolder];
	[IGFilesystemIO makeFolderPath:p];
	return [NSString stringWithFormat:@"%@%@", p, dbName];
}

// public; returns path to the documents/db folder, creates the path if this one doesn't exist and creates empty db file
+ (NSString *)getPathToDb:(NSString *)dbName {
	NSString *p = [self _getPathToDb:dbName];
	if (![IGFilesystemIO isFile:p]) {
		NSMutableDictionary *d = [[[NSMutableDictionary alloc] init] autorelease];
		[d setObject:[self _encodeNumber:0] forKey:kIGSimpleDBAIKey];
		[d setObject:[[[NSMutableArray alloc] init] autorelease] forKey:kIGSimpleDBDataKey];
		[d setObject:[[[NSMutableDictionary alloc] init] autorelease] forKey:kIGSimpleDBIndexKey];
		[d writeToFile:p atomically:YES];
		if (![IGFilesystemIO isFile:p]) NSAssert(@"Unable to create database '%@' in IGSimpleDB.", dbName);
	}
	return p;
}

// public; checks if database file exists
+ (BOOL)isDatabase:(NSString *)dbName {
	NSString *p = [self _getPathToDb:dbName];
	return [IGFilesystemIO isFile:p];
}

// private; returns full database file
+ (NSDictionary *)_getFullDataForDb:(NSString *)dbName {
	NSString *p = [self getPathToDb:dbName];
	return [[[NSDictionary alloc] initWithContentsOfFile:p] autorelease];
}

// public; deletes the database file
+ (BOOL)deleteDb:(NSString *)dbName {
	NSString *p = [self getPathToDb:dbName];
	if ([IGFilesystemIO isFile:p]) return [IGFilesystemIO deleteFile:p];
	else return YES;
}

// public; truncates the databse fil and sets autoincrement value to zero
+ (BOOL)truncateDb:(NSString *)dbName {
	[self deleteDb:dbName];
	NSString *p = [self getPathToDb:dbName];
	return [IGFilesystemIO isFile:p];
}

// public; returns value of actual autoincrement number
+ (int)getAutoincrementNumberForDb:(NSString *)dbName {
	NSDictionary *d = [self _getFullDataForDb:dbName];
	return (int) [[d objectForKey:kIGSimpleDBAIKey] intValue];
}

// public; returns all items from the db as NSArray
+ (NSArray *)getItemsFromDb:(NSString *)dbName {
	NSDictionary *d = [self _getFullDataForDb:dbName];
	return (NSArray *) [d objectForKey:kIGSimpleDBDataKey];
}

// public; returns all items from the db as NSArray
+ (NSMutableArray *)getMutableItemsFromDb:(NSString *)dbName {
	NSDictionary *d = [self _getFullDataForDb:dbName];
	return (NSMutableArray *) [[[NSMutableArray alloc] initWithArray:[d objectForKey:kIGSimpleDBDataKey]] autorelease];
}

// private; converts id of the item to index position in the array
+ (int)_getIndexForId:(int)idItem inDb:(NSString *)dbName {
	NSDictionary *d = [self _getFullDataForDb:dbName];
	return (int) [[[d objectForKey:kIGSimpleDBIndexKey] objectForKey:[self _encodeNumber:idItem]] intValue];
}

// private; recreates index for all the id's and items in the db
+ (void)_reloadIndexTableInDb:(NSString *)dbName {
	NSMutableDictionary *f = (NSMutableDictionary *)[self _getFullDataForDb:dbName];
	NSArray *arr = (NSArray *)[f objectForKey:kIGSimpleDBDataKey];
	NSMutableDictionary *n = [[[NSMutableDictionary alloc] init] autorelease];
	int index = 0;
	for (NSDictionary *d in arr) {
		[n setObject:[self _encodeNumber:index] forKey:[d objectForKey:kIGSimpleDBMainIdKey]];
		index++;
	}
	[f setObject:n forKey:kIGSimpleDBIndexKey];
	NSString *p = [self getPathToDb:dbName];
	[f writeToFile:p atomically:YES];
}

// private; increases autoincrement value for the databse
+ (int)_increaseAIinDb:(NSString *)dbName {
	NSMutableDictionary *f = (NSMutableDictionary *)[self _getFullDataForDb:dbName];
	int ai = ([self getAutoincrementNumberForDb:dbName] + 1);
	[f setObject:[self _encodeNumber:ai] forKey:kIGSimpleDBAIKey];
	NSString *p = [self getPathToDb:dbName];
	[f writeToFile:p atomically:YES];
	return ai;
}

// public, saves the full given array back to he database
+ (void)saveFullData:(NSArray *)arr toDb:(NSString *)dbName {
	NSMutableDictionary *f = (NSMutableDictionary *)[self _getFullDataForDb:dbName];
	[f setObject:arr forKey:kIGSimpleDBDataKey];
	NSString *p = [self getPathToDb:dbName];
	[f writeToFile:p atomically:YES];
	[self _reloadIndexTableInDb:dbName];
}

// public; returns number of items in the selected db
+ (int)getNumberOfItemsInDb:(NSString *)dbName {
	NSArray *arr = [self getItemsFromDb:dbName];
	return [arr count];
}

// public; returns one item with specific id
+ (NSDictionary *)getItem:(int)idItem inDb:(NSString *)dbName {
	NSArray *arr = [self getItemsFromDb:dbName];
	return (NSDictionary *)[arr objectAtIndex:[self _getIndexForId:idItem inDb:dbName]];
}

// public; add given item to the end of the database
+ (int)addItemToBottom:(NSDictionary *)item intoDb:(NSString *)dbName {
	NSMutableArray *arr = (NSMutableArray *) [self getMutableItemsFromDb:dbName];
	int i = [self _increaseAIinDb:dbName];
	NSMutableDictionary *nd = (NSMutableDictionary *)item;
	[nd setObject:[self _encodeNumber:i] forKey:kIGSimpleDBMainIdKey];
	[arr addObject:nd];
	[self saveFullData:arr toDb:dbName];
	return i;
}

// public; add given item to the beginning of the database
+ (int)addItemToTop:(NSDictionary *)item intoDb:(NSString *)dbName {
	NSMutableArray *arr = (NSMutableArray *) [self getMutableItemsFromDb:dbName];
	NSMutableArray *narr = [[[NSMutableArray alloc] init] autorelease];
	int i = [self _increaseAIinDb:dbName];
	NSMutableDictionary *nd = (NSMutableDictionary *)item;
	[nd setObject:[self _encodeNumber:i] forKey:kIGSimpleDBMainIdKey];
	[narr addObject:nd];
	for (NSDictionary *d in arr) [narr addObject:d];
	[self saveFullData:narr toDb:dbName];
	return i;
}

// public; deletes id specific item from the database
+ (void)deleteItem:(int)idItem fromDb:(NSString *)dbName {
	NSMutableArray *arr = (NSMutableArray *) [self getMutableItemsFromDb:dbName];
	[arr removeObjectAtIndex:[self _getIndexForId:idItem inDb:dbName]];
	[self saveFullData:arr toDb:dbName];
}

// public; updates id specific item in the database
+ (void)updateItem:(int)idItem withData:(NSDictionary *)item inDb:(NSString *)dbName {
	NSMutableArray *arr = (NSMutableArray *) [self getMutableItemsFromDb:dbName];
	NSMutableArray *narr = [[[NSMutableArray alloc] init] autorelease];
	int ai;
	for (NSDictionary *d in arr) {
		ai = [[d objectForKey:kIGSimpleDBMainIdKey] intValue];
		if (ai == idItem) [narr addObject:item];
		else [narr addObject:d];
	}
	[self saveFullData:narr toDb:dbName];
}

// public; moves item in the db, the input values are the same that are coming from:
+ (void)moveTableItem:(NSIndexPath *)fromIndexPath to:(NSIndexPath *)toIndexPath inDb:(NSString *)dbName {
	NSMutableArray *arr = (NSMutableArray *) [self getMutableItemsFromDb:dbName];
	NSDictionary *i = [[[arr objectAtIndex:fromIndexPath.row] retain] autorelease];
	[arr removeObjectAtIndex:fromIndexPath.row];
	[arr insertObject:i atIndex:toIndexPath.row];
	[self saveFullData:arr toDb:dbName];
}

// public; duplicates id specific item in the database and adds this one to the end of db
+ (int)duplicateItemToBottom:(int)idItem inDb:(NSString *)dbName {
	NSMutableDictionary *d = (NSMutableDictionary *)[self getItem:idItem inDb:dbName];
	[d removeObjectForKey:kIGSimpleDBMainIdKey];
	return [self addItemToBottom:d intoDb:dbName];
}

// public; duplicates id specific item in the database and adds this one to the beginning of db
+ (int)duplicateItemToTop:(int)idItem inDb:(NSString *)dbName {
	NSMutableDictionary *d = (NSMutableDictionary *)[self getItem:idItem inDb:dbName];
	[d removeObjectForKey:kIGSimpleDBMainIdKey];
	return [self addItemToTop:d intoDb:dbName];
}

// method in development, comments welcome
+ (NSArray *)sortAscendingByKey:(NSString *)key inDb:(NSString *)dbName {
	return [self getItemsFromDb:dbName];
}

// method in development, comments welcome
+ (NSArray *)sortDescendingByKey:(NSString *)key inDb:(NSString *)dbName {
	return [self getItemsFromDb:dbName];
}

+ (BOOL)isSelected:(int)idItem inDb:(NSString *)dbName {
	NSDictionary *d = [self getItem:idItem inDb:dbName];
	NSString *v = (NSString *)[d objectForKey:kIGSimpleDBSelectedKey];
	if (!v) return NO;
	else return (BOOL) [v intValue];
}

+ (void)setSelected:(BOOL)selected forItem:(int)idItem inDb:(NSString *)dbName {
	NSMutableDictionary *d = [[[NSMutableDictionary alloc] initWithDictionary:[self getItem:idItem inDb:dbName]] autorelease];
	[d setValue:[self _encodeNumber:(int)selected] forKey:kIGSimpleDBSelectedKey];
	[self updateItem:idItem withData:(NSDictionary *)d inDb:dbName];
}

+ (BOOL)isDictionarySelected:(NSDictionary *)item inDb:(NSString *)dbName {
	int idItem = [self getId:item];
	return [self isSelected:idItem inDb:dbName];
}

+ (void)setDictionarySelected:(BOOL)selected dictionary:(NSDictionary *)item inDb:(NSString *)dbName {
	int idItem = [self getId:item];
	[self setSelected:selected forItem:idItem inDb:dbName];
}


@end
