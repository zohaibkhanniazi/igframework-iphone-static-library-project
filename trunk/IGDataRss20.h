//
//  IGDataRss20.h
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 4.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IGDataRss20;

@protocol IGDataRss20Delegate <NSObject>

@optional

- (void)rssParsingStarted:(NSXMLParser *)parser;

- (void)rssParsingError:(NSString *)message;

- (void)rssParsingEnded:(NSArray *)result;

@end


@interface IGDataRss20 : NSObject {
	
	NSXMLParser *rssParser;
    NSMutableArray *data;
	
    NSMutableDictionary *currentItem;
	
	NSString *currentElement;
	
	id <IGDataRss20Delegate> delegate;
	
}

@property (nonatomic, retain) NSMutableArray *data;

@property (nonatomic, assign) id <IGDataRss20Delegate> delegate;


- (void)initWithContentsOfUrl:(NSString *)rssUrl;

- (void)initWithContentsOfData:(NSData *)inputData;


@end
