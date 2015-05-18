//
//  RNStandardUserDefaultsIOS.m
//  RNStandardUserDefaultsIOS
//
//  Created by Dave Sibiski on 5/15/15.
//  Copyright (c) 2015 Dave Sibiski. All rights reserved.
//

#import "RNUserDefaultsIOS.h"
#import "UserDefaultsManager.h"

@implementation RNUserDefaultsIOS

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(arrayForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [UserDefaultsManager arrayForKey:key];
    
    callback(@[[NSNull null], response]);
}

RCT_EXPORT_METHOD(stringForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [UserDefaultsManager stringForKey:key];
    
    callback(@[[NSNull null], response]);
}

@end
