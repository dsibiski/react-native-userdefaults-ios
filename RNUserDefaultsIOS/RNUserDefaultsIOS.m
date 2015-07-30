//
//  RNStandardUserDefaultsIOS.m
//  RNStandardUserDefaultsIOS
//
//  Created by Dave Sibiski on 5/15/15.
//  Copyright (c) 2015 Dave Sibiski. All rights reserved.
//

#import "RNUserDefaultsIOS.h"
#import "UserDefaultsManager.h"

@interface RNUserDefaultsIOS ()

@property (nonatomic, strong) UserDefaultsManager *userDefaultsManager;

@end

@implementation RNUserDefaultsIOS

RCT_EXPORT_MODULE()

- (id) init
{
    self = [super init];
    if (self) {
        _userDefaultsManager = [UserDefaultsManager new];
    }
    return self;
}

RCT_EXPORT_METHOD(setUserDefaultsSuiteName:(NSString *)suiteName callback:(RCTResponseSenderBlock)callback) {
    [self.userDefaultsManager setUserDefaultsSuiteName:suiteName];
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(setObjectForKey:(id)object key:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    [self.userDefaultsManager setObject:object forKey:key];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(setBoolForKey:(BOOL)value key:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    [self.userDefaultsManager setBool:value forKey:key];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(removeObjectForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    [self.userDefaultsManager removeObjectForKey:key];
    
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(arrayForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [self.userDefaultsManager arrayForKey:key];
    
    if (response) {
        
        callback(@[[NSNull null], response]);
    }
    else {
    
        callback(@[[NSNull null], [NSNull null]]);
    }
}

RCT_EXPORT_METHOD(stringForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [self.userDefaultsManager stringForKey:key];
    
    if (response) {
        
        callback(@[[NSNull null], response]);
    }
    else {
    
        callback(@[[NSNull null], [NSNull null]]);
    }
}

RCT_EXPORT_METHOD(objectForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    id response = [self.userDefaultsManager objectForKey:key];
    
    if (response) {
        
        callback(@[[NSNull null], response]);
    }
    else {
    
        callback(@[[NSNull null], [NSNull null]]);
    }
}

RCT_EXPORT_METHOD(boolForKey:(NSString *)key callback:(RCTResponseSenderBlock)callback) {
    
    bool response = [self.userDefaultsManager boolForKey:key];
    
    callback(@[[NSNull null], [NSNumber numberWithBool:response]]);
}

@end
