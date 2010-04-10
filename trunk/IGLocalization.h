///
///  IGLocalization.h
///
///  IGFramework
///
///  Created by Ondrej Rafaj on 22.3.10.
///
///  Copyright 2010 Home. All rights reserved.
///
/**
 
 
 
 
 
 */

#import <Foundation/Foundation.h>


@interface IGLocalization : NSObject {
	
}

+ (BOOL)registerLanguageServer:(NSString *)serverUrl;

+ (BOOL)isUpdateAvailable;

+ (void)setDefaultLanguageCode:(NSString *)languageCode;

+ (void)setCurrentLanguageCode:(NSString *)languageCode;

+ (NSString *)getSystemLanguageCode;

+ (NSString *)getCurrentLanguageCode;

+ (NSArray *)getAvailableLanguages;

+ (NSArray *)getAvailableLanguagesOnTheServer;

+ (BOOL)updateLanguage:(NSString *)languageCode;

+ (BOOL)updateAllLanguages;

+ (BOOL)tryGetTranslationFileForSystemLanguage;

+ (void)reportSystemLanguage;

+ (void)reportMissingTranslations;

+ (void)installBundleLanguage:(NSString *)bundleFilename;

+ (NSArray *)getSystemCountryCodes;

+ (NSString *)get:(NSString *)localizationKey;



@end



