//
//  StandardUserDefaultsManager.h
//  RNStandardUserDefaultsIOS
//
//  Created by Dave Sibiski on 5/15/15.
//  Copyright (c) 2015 Dave Sibiski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsManager : NSObject

- (void)setUserDefaultsSuiteName:(NSString *)suiteName;

- (void)setObject:(id)object forKey:(NSString *)key;

- (void)setBool:(bool)value forKey:(NSString *)key;

- (void)removeObjectForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key;

- (id)objectForKey:(NSString *)key;

- (bool)boolForKey:(NSString *)key;

@end
