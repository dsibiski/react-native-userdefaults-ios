//
//  StandardUserDefaultsManager.h
//  RNStandardUserDefaultsIOS
//
//  Created by Dave Sibiski on 5/15/15.
//  Copyright (c) 2015 Dave Sibiski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsManager : NSObject

+ (NSArray *)arrayForKey:(NSString *)key;

+ (NSString *)stringForKey:(NSString *)key;

@end
