//
//  GlobalMethods.h
//  Coupo
//
//  Created by Grigo Mathews on 16/07/14.
//  Copyright (c) 2014 Paulose Ink. All rights reserved.
//
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#import <Foundation/Foundation.h>

@interface GlobalMethods : NSObject {
    BOOL timedOut;
    BOOL connect;
}

- (BOOL) connected;
- (NSString *)stringTrimming:(NSString *)string;
- (NSString *)trimmingFunctionforNewLine:(NSString *)str;

@end
