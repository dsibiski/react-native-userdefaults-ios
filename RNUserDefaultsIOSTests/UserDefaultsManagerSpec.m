#import <XCTest/XCTest.h>
#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "UserDefaultsManager.h"

@interface UserDefaultsManager (Test)
@end

SpecBegin(UserDefaultsManager)

describe(@"UserDefaultsManager", ^{
    
    __block NSUserDefaults *userDefaults;
    
    beforeEach(^{
        
        userDefaults = [NSUserDefaults standardUserDefaults];
        
    });
    
    describe(@"#arrayForKey", ^{
        
        it(@"returns the correct array", ^{
            
            [userDefaults setValue:@[@"anyArray"] forKey:@"anyArray"];
           
            NSArray *sut = [UserDefaultsManager arrayForKey:@"anyArray"];
           
            expect(sut).to.equal(@[@"anyArray"]);
            
        });
        
        it(@"returns the correct array", ^{
            
            [userDefaults setValue:@[@"different", @"array"] forKey:@"anyArray"];
           
            NSArray *sut = [UserDefaultsManager arrayForKey:@"anyArray"];
            
            expect(sut).to.equal(@[@"different", @"array"]);
            
        });
        
    });

    describe(@"#stringForKey", ^{
        
        it(@"returns the correct string", ^{
            
            [userDefaults setValue:@"anyValue" forKey:@"anyKey"];
            
            NSString *sut = [UserDefaultsManager stringForKey:@"anyKey"];
            
            expect(sut).to.equal(@"anyValue");
            
        });
        
        it(@"returns a different string", ^{
            
            [userDefaults setValue:@"aDifferentValue" forKey:@"anyKey"];
            
            NSString *sut = [UserDefaultsManager stringForKey:@"anyKey"];
            
            expect(sut).to.equal(@"aDifferentValue");
            
        });
        
    });
    
    afterEach(^{
        
        userDefaults = nil;
        
    });

});

SpecEnd