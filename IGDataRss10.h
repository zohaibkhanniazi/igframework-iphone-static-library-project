//
//  IGDataRss10.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 4.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IGDataRss10;

@protocol IGDataRss10Delegate <NSObject>

- (void)rssParsingEnded:(NSArray *)result;

@optional

- (void)rssParsingStarted:(NSXMLParser *)parser;

- (void)rssParsingError:(NSString *)message;

@end


@interface IGDataRss10 : NSObject {
	
	NSXMLParser *rssParser;
    NSMutableArray *data;
	
    NSMutableDictionary *currentItem;
	
	NSString *currentElement;
	
	id <IGDataRss10Delegate> delegate;
	
}

@property (nonatomic, retain) NSMutableArray *data;

@property (nonatomic, assign) id <IGDataRss10Delegate> delegate;


- (void)initWithContentsOfUrl:(NSString *)rssUrl;

- (void)initWithContentsOfData:(NSData *)inputData;


@end
