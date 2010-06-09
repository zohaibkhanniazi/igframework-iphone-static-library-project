//
//  IGDataRss10.m
//  IGFrameworkProject
//
//  Created by Ondrej Rafaj on 4.4.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGDataRss10.h"


@implementation IGDataRss10

@synthesize data, delegate;

- (void)initWithContentsOfUrl:(NSString *)rssUrl {
	self.data = [[NSMutableArray alloc] init];
	NSURL *xmlURL = [NSURL URLWithString:rssUrl];
	rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	[rssParser setDelegate:self];
	[rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	[rssParser parse];
}

- (void)initWithContentsOfData:(NSData *)inputData {
	self.data = [[NSMutableArray alloc] init];
	rssParser = [[NSXMLParser alloc] initWithData:inputData];
	[rssParser setDelegate:self];
	[rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	[rssParser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    [[self delegate] rssParsingStarted:parser];
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    NSString * errorString = [NSString stringWithFormat:@"Unable to parse RSS feed (Error code %i )", [parseError code]];
	NSLog(@"Error parsing XML: %@", errorString);
	if ([parseError code] == 31) NSLog(@"Error code 31 is usually caused by encoding problem. Try to load any UTF-8 feed instead.");
	[[self delegate] rssParsingError:errorString];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    currentElement = [elementName copy];
    if ([elementName isEqualToString:@"item"]) currentItem = [[NSMutableDictionary alloc] init];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        [data addObject:(NSDictionary *)[[currentItem copy] autorelease]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	if (![currentItem objectForKey:currentElement]) [currentItem setObject:[[[NSMutableString alloc] init] autorelease] forKey:currentElement];
	[[currentItem objectForKey:currentElement] appendString:string];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
	//NSLog(@"RSS array has %d items: %@", [data count], data);
	[[self delegate] rssParsingEnded:(NSArray *)self.data];
}

- (void)dealloc {
	[data, delegate release];
	[super dealloc];
}

@end
