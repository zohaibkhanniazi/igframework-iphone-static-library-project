//
//  IGLocalization.m
//  IGFramework
//
//  Created by Ondrej Rafaj on 22.3.10.
//  Copyright 2010 Home. All rights reserved.
//

#import "IGLocalization.h"
#import "IGSettingsUser.h"


#define kIGLocalizationServerId								@"kIGLocalizationServerId"
#define kIGLocalizationLocalVersionsId						@"kIGLocalizationLocalVersionsId"
#define kIGLocalizationDefLangCodeId						@"kIGLocalizationDefLangCodeId"
#define kIGLocalizationCurLangCodeId						@"kIGLocalizationCurLangCodeId"
#define kIGLocalizationAllLanguagesArrId					@"kIGLocalizationAllLanguagesArrId"
#define kIGLocalizationActiveLanguageId						@"kIGLocalizationActiveLanguageId"
#define kIGLocalizationMissingTranslationsId				@"kIGLocalizationServerId"


@implementation IGLocalization

+ (BOOL)registerLanguageServer:(NSString *)serverUrl {
	return YES;
}

+ (BOOL)isUpdateAvailable {
	return YES;
}

+ (void)setDefaultLanguageCode:(NSString *)languageCode {
	
}

+ (void)setCurrentLanguageCode:(NSString *)languageCode {
	
}

+ (NSString *)getSystemLanguageCode {
	return @"";
}

+ (NSString *)getCurrentLanguageCode {
	return @"";
}

+ (NSArray *)getAvailableLanguages {
	return nil;
}

+ (NSArray *)getAvailableLanguagesOnTheServer {
	return nil;
}

+ (BOOL)updateLanguage:(NSString *)languageCode {
	return YES;
}

+ (BOOL)updateAllLanguages {
	return YES;
}

+ (BOOL)tryGetTranslationFileForSystemLanguage {
	return YES;
}

+ (void)reportSystemLanguage {
	
}

+ (void)reportMissingTranslations {
	
}

+ (void)installBundleLanguage:(NSString *)bundleFilename {
	
}

+ (NSArray *)getSystemCountryCodes {
	return nil;
}

/**
 Returns localization for given key/string 
 
 @param localizationKey NSString Key for the traslation
 
 @return NSString Localized string
 */
+ (NSString *)get:(NSString *)localizationKey {
	return localizationKey;
}


@end
