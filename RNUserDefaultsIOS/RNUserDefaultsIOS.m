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

RCT_EXPORT_METHOD(registerDefaults:(NSDictionary*)dict callback:(RCTResponseSenderBlock)callback) {
    
    [UserDefaultsManager registerDefaults:dict];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(setObjectForKey:(id)object key:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    [UserDefaultsManager setObject:object forKey:key];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(setBoolForKey:(BOOL)value key:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    [UserDefaultsManager setBool:value forKey:key];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(removeObjectForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    [UserDefaultsManager removeObjectForKey:key];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(arrayForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [UserDefaultsManager arrayForKey:key];
    
    if (response) {
        
        callback(@[[NSNull null], response]);
    }
    else {
    
        callback(@[[NSNull null], [NSNull null]]);
    }
}

RCT_EXPORT_METHOD(stringForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [UserDefaultsManager stringForKey:key];
    
    if (response) {
        
        callback(@[[NSNull null], response]);
    }
    else {
    
        callback(@[[NSNull null], [NSNull null]]);
    }
}

RCT_EXPORT_METHOD(objectForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [UserDefaultsManager objectForKey:key];
    
    if (response) {
        
        callback(@[[NSNull null], response]);
    }
    else {
    
        callback(@[[NSNull null], [NSNull null]]);
    }
}

RCT_EXPORT_METHOD(boolForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    bool response = [UserDefaultsManager boolForKey:key];
    
    callback(@[[NSNull null], [NSNumber numberWithBool:response]]);
}

@end
