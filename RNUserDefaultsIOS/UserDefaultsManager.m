//
//  StandardUserDefaultsManager.m
//  RNStandardUserDefaultsIOS
//
//  Created by Dave Sibiski on 5/15/15.
//  Copyright (c) 2015 Dave Sibiski. All rights reserved.
//

#import "UserDefaultsManager.h"

@interface UserDefaultsManager ()

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end

@implementation UserDefaultsManager

- (id)init
{
    self = [super init];
    if (self) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return self;
}

- (void)setUserDefaultsSuiteName:(NSString *)suiteName
{
    _userDefaults = [[NSUserDefaults alloc] initWithSuiteName:suiteName];
}

- (void)setObject:(id)object forKey:(NSString *)key {
    
    [self.userDefaults setObject:object forKey:key];
    [self.userDefaults synchronize];
}

- (void)setBool:(bool)value forKey:(NSString *)key {
    
    [self.userDefaults setBool:value forKey:key];
    [self.userDefaults synchronize];
}

- (void)removeObjectForKey:(NSString *)key {
    
    [self.userDefaults removeObjectForKey:key];
    [self.userDefaults synchronize];
}

- (NSArray *)arrayForKey:(NSString *)key {
    
    return [self.userDefaults arrayForKey:key];
}

- (NSString *)stringForKey:(NSString *)key {
    
    return [self.userDefaults stringForKey:key];
}

- (id)objectForKey:(NSString *)key {
    
    return [self.userDefaults objectForKey:key];
}

- (bool)boolForKey:(NSString *)key {
    
    return [self.userDefaults boolForKey:key];
}

@end
