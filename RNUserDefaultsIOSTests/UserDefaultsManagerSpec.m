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
    
    describe(@"writing", ^{
        
        describe(@"#setObject:forKey:", ^{
            
            it(@"sets a string for given key", ^{
                
                [[UserDefaultsManager new] setObject:@"someString" forKey:@"anyKey"];
                
                NSString *sut = [userDefaults objectForKey:@"anyKey"];
                
                expect(sut).to.equal(@"someString");
                
            });
            
            it(@"sets an array for a given key", ^{
                
                [[UserDefaultsManager new] setObject:@[@"someStringInAnArray"] forKey:@"anyKey"];
                
                NSArray *sut = [userDefaults arrayForKey:@"anyKey"];
                
                expect(sut).to.equal(@[@"someStringInAnArray"]);
                
            });
            
        });
        
        describe(@"#setBool:forKey:", ^{
            
            it(@"sets a bool for given key", ^{
                
                [[UserDefaultsManager new] setBool:YES forKey:@"anyKey"];
                
                BOOL sut = [userDefaults boolForKey:@"anyKey"];
                
                expect(sut).to.equal(YES);
                
            });
            
            it(@"sets a different bool for given key", ^{
                
                [[UserDefaultsManager new] setBool:NO forKey:@"anyKey"];
                
                BOOL sut = [userDefaults boolForKey:@"anyKey"];
                
                expect(sut).to.equal(NO);
                
            });
            
        });
        
        describe(@"#removeObjectForKey:", ^{
            
            it(@"removes the object for given key", ^{
                
                [userDefaults setObject:@"anyValue" forKey:@"objectToRemove"];
                
                [[UserDefaultsManager new] removeObjectForKey:@"objectToRemove"];
                
                expect([userDefaults objectForKey:@"objectToRemove"]).to.beNil();
                
            });
            
            it(@"removes a boolean value for given key", ^{
                
                [userDefaults setBool:YES forKey:@"objectToRemove"];
                
                [[UserDefaultsManager new] removeObjectForKey:@"objectToRemove"];
                
                expect([userDefaults boolForKey:@"objectToRemove"]).to.equal(NO);
                
            });
            
        });
        
    });
    
    describe(@"reading", ^{
        
        describe(@"#arrayForKey:", ^{
            
            it(@"returns the correct array", ^{
                
                [userDefaults setValue:@[@"anyArray"] forKey:@"anyArray"];
                
                NSArray *sut = [[UserDefaultsManager new] arrayForKey:@"anyArray"];
                
                expect(sut).to.equal(@[@"anyArray"]);
                
            });
            
            it(@"returns the correct array", ^{
                
                [userDefaults setValue:@[@"different", @"array"] forKey:@"anyArray"];
                
                NSArray *sut = [[UserDefaultsManager new] arrayForKey:@"anyArray"];
                
                expect(sut).to.equal(@[@"different", @"array"]);
                
            });
            
        });
        
        describe(@"#stringForKey:", ^{
            
            it(@"returns the correct string", ^{
                
                [userDefaults setValue:@"anyValue" forKey:@"anyKey"];
                
                NSString *sut = [[UserDefaultsManager new] stringForKey:@"anyKey"];
                
                expect(sut).to.equal(@"anyValue");
                
            });
            
            it(@"returns a different string", ^{
                
                [userDefaults setValue:@"aDifferentValue" forKey:@"anyKey"];
                
                NSString *sut = [[UserDefaultsManager new] stringForKey:@"anyKey"];
                
                expect(sut).to.equal(@"aDifferentValue");
                
            });
            
        });
        
        describe(@"#objectForKey:", ^{
            
            it(@"returns the correct Dictionary", ^{
                
                NSDictionary *testDict = @{@"anything" : @"something"};
                
                [userDefaults setObject:testDict forKey:@"anyKey"];
                
                NSDictionary *sut = [[UserDefaultsManager new] objectForKey:@"anyKey"];
                
                expect(sut).to.equal(testDict);
                
            });
            
            it(@"returns a different Dictionary", ^{
                
                NSDictionary *testDict = @{@"anythingElse" : @"somethingElse"};
                
                [userDefaults setObject:testDict forKey:@"anyKey"];
                
                NSDictionary *sut = [[UserDefaultsManager new] objectForKey:@"anyKey"];
                
                expect(sut).to.equal(testDict);
                
            });
            
        });
        
        describe(@"#boolForKey:", ^{
            
            it(@"returns the correct Boolean value", ^{
                
                [userDefaults setBool:YES forKey:@"anyKey"];
                
                BOOL sut = [[UserDefaultsManager new] boolForKey:@"anyKey"];
                
                expect(sut).to.equal(YES);
                
            });
            
            it(@"returns a different Boolean value", ^{
                
                [userDefaults setBool:NO forKey:@"anyKey"];
                
                BOOL sut = [[UserDefaultsManager new] boolForKey:@"anyKey"];
                
                expect(sut).to.equal(NO);
                
            });
        });
        
    });
    
    afterEach(^{
        
        userDefaults = nil;
        
    });

});

SpecEnd