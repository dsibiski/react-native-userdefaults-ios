#import <XCTest/XCTest.h>
#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#import "UserDefaultsManager.h"

#ifndef RCTRegisterModule
void RCTRegisterModule() {
}
#endif

@interface UserDefaultsManager (Test)
@end

SpecBegin(UserDefaultsManager)

describe(@"UserDefaultsManager", ^{
    
    __block NSUserDefaults *userDefaults;
    
    beforeEach(^{
        
        userDefaults = [NSUserDefaults standardUserDefaults];
        
    });
    
    describe(@"writing", ^{
        describe(@"#registerDefaults:", ^{
            it(@"", ^{

                NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"My-Custom-User-Agent", @"UserAgent", nil];
                
                [UserDefaultsManager registerDefaults:dictionary];

                expect([userDefaults stringForKey:@"UserAgent"]).to.equal(@"My-Custom-User-Agent");
            });
        });
        describe(@"#setObject:forKey:", ^{
            
            it(@"sets a string for given key", ^{
                
                [UserDefaultsManager setObject:@"someString" forKey:@"anyKey"];
                
                NSString *sut = [userDefaults objectForKey:@"anyKey"];
                
                expect(sut).to.equal(@"someString");
                
            });
            
            it(@"sets an array for a given key", ^{
                
                [UserDefaultsManager setObject:@[@"someStringInAnArray"] forKey:@"anyKey"];
                
                NSArray *sut = [userDefaults arrayForKey:@"anyKey"];
                
                expect(sut).to.equal(@[@"someStringInAnArray"]);
                
            });
            
        });
        
        describe(@"#setBool:forKey:", ^{
            
            it(@"sets a bool for given key", ^{
                
                [UserDefaultsManager setBool:YES forKey:@"anyKey"];
                
                BOOL sut = [userDefaults boolForKey:@"anyKey"];
                
                expect(sut).to.equal(YES);
                
            });
            
            it(@"sets a different bool for given key", ^{
                
                [UserDefaultsManager setBool:NO forKey:@"anyKey"];
                
                BOOL sut = [userDefaults boolForKey:@"anyKey"];
                
                expect(sut).to.equal(NO);
                
            });
            
        });
        
        describe(@"#removeObjectForKey:", ^{
            
            it(@"removes the object for given key", ^{
                
                [userDefaults setObject:@"anyValue" forKey:@"objectToRemove"];
                
                [UserDefaultsManager removeObjectForKey:@"objectToRemove"];
                
                expect([userDefaults objectForKey:@"objectToRemove"]).to.beNil();
                
            });
            
            it(@"removes a boolean value for given key", ^{
                
                [userDefaults setBool:YES forKey:@"objectToRemove"];
                
                [UserDefaultsManager removeObjectForKey:@"objectToRemove"];
                
                expect([userDefaults boolForKey:@"objectToRemove"]).to.equal(NO);
                
            });
            
        });
        
    });
    
    describe(@"reading", ^{
        
        describe(@"#arrayForKey:", ^{
            
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
        
        describe(@"#stringForKey:", ^{
            
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
        
        describe(@"#objectForKey:", ^{
            
            it(@"returns the correct Dictionary", ^{
                
                NSDictionary *testDict = @{@"anything" : @"something"};
                
                [userDefaults setObject:testDict forKey:@"anyKey"];
                
                NSDictionary *sut = [UserDefaultsManager objectForKey:@"anyKey"];
                
                expect(sut).to.equal(testDict);
                
            });
            
            it(@"returns a different Dictionary", ^{
                
                NSDictionary *testDict = @{@"anythingElse" : @"somethingElse"};
                
                [userDefaults setObject:testDict forKey:@"anyKey"];
                
                NSDictionary *sut = [UserDefaultsManager objectForKey:@"anyKey"];
                
                expect(sut).to.equal(testDict);
                
            });
            
        });
        
        describe(@"#boolForKey:", ^{
            
            it(@"returns the correct Boolean value", ^{
                
                [userDefaults setBool:YES forKey:@"anyKey"];
                
                BOOL sut = [UserDefaultsManager boolForKey:@"anyKey"];
                
                expect(sut).to.equal(YES);
                
            });
            
            it(@"returns a different Boolean value", ^{
                
                [userDefaults setBool:NO forKey:@"anyKey"];
                
                BOOL sut = [UserDefaultsManager boolForKey:@"anyKey"];
                
                expect(sut).to.equal(NO);
                
            });
        });
        
    });
    
    afterEach(^{
        
        userDefaults = nil;
        
    });

});

SpecEnd
