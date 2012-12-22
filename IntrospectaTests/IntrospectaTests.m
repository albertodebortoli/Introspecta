//
//  IntrospectaTests.m
//  IntrospectaTests
//
//  Created by Alberto De Bortoli on 12/19/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "IntrospectaTests.h"

@implementation IntrospectaTests

- (void)setUp
{
    [super setUp];
    
    self.childTestObject = [[ISChildTestObject alloc] init];
    self.childTestObject.property1 = @"property1";
    self.childTestObject.property2 = @42;
    self.childTestObject.property3 = 42;
    self.childTestObject.property4 = YES;
    self.childTestObject.property5 = @"property5";
    self.childTestObject.property6 = @108;
    self.childTestObject.property7 = 108;
    self.childTestObject.property8 = NO;
}

- (void)tearDown
{
    self.childTestObject = nil;
    
    [super tearDown];
}

- (void)testCocoaSerialization
{
    NSDictionary *test = [self.childTestObject cocoaSerialization];
    NSDictionary *result = @{
        @"_ivar1" : @"property1",
        @"_ivar2" : @42,
        @"_ivar3" : @42,
        @"_ivar4" : @YES,
        @"_ivar5" : @"property5",
        @"_ivar6" : @108,
        @"_ivar7" : @108,
        @"_ivar8" : @NO
    };
    STAssertEqualObjects(test, result, @"objects should be equal");
}

- (void)testIVars
{
    NSArray *test = [[self.childTestObject class] iVars];
    
    ISVar *var1 = [ISVar iVarWithName:@"_ivar1" type:@"@\"NSString\""];
    ISVar *var2 = [ISVar iVarWithName:@"_ivar2" type:@"@\"NSNumber\""];
    ISVar *var3 = [ISVar iVarWithName:@"_ivar3" type:@"i"];
    ISVar *var4 = [ISVar iVarWithName:@"_ivar4" type:@"c"];
    ISVar *var5 = [ISVar iVarWithName:@"_ivar5" type:@"@\"NSString\""];
    ISVar *var6 = [ISVar iVarWithName:@"_ivar6" type:@"@\"NSNumber\""];
    ISVar *var7 = [ISVar iVarWithName:@"_ivar7" type:@"i"];
    ISVar *var8 = [ISVar iVarWithName:@"_ivar8" type:@"c"];
    NSArray *result = @[var1, var2, var3, var4, var5, var6, var7, var8];
    
    STAssertEquals(test.count, result.count, @"array should have same length");
    
    for (int i = 0; i < test.count; i++) {
        STAssertEqualObjects([test objectAtIndex:i], [result objectAtIndex:i], @"objects should be equal");
    }
}

- (void)testProperties
{
    NSArray *test = [[self.childTestObject class] properties];
    
    ISVar *property1 = [ISVar iVarWithName:@"property1" type:@"T@\"NSString\",C,N,V_ivar1"];
    ISVar *property2 = [ISVar iVarWithName:@"property2" type:@"T@\"NSNumber\",&,N,V_ivar2"];
    ISVar *property3 = [ISVar iVarWithName:@"property3" type:@"Ti,N,V_ivar3"];
    ISVar *property4 = [ISVar iVarWithName:@"property4" type:@"Tc,N,V_ivar4"];
    ISVar *property5 = [ISVar iVarWithName:@"property5" type:@"T@\"NSString\",C,N,V_ivar5"];
    ISVar *property6 = [ISVar iVarWithName:@"property6" type:@"T@\"NSNumber\",&,N,V_ivar6"];
    ISVar *property7 = [ISVar iVarWithName:@"property7" type:@"Ti,N,V_ivar7"];
    ISVar *property8 = [ISVar iVarWithName:@"property8" type:@"Tc,N,V_ivar8"];
    NSArray *result = @[property1, property2, property3, property4, property5, property6, property7, property8];
    
    STAssertEquals(test.count, result.count, @"array should have same length");
    
    for (int i = 0; i < test.count; i++) {
        STAssertEqualObjects([test objectAtIndex:i], [result objectAtIndex:i], @"objects should be equal");
    }
}

- (void)testMethods
{
    NSArray *test = [[self.childTestObject class] methods];
    
    NSString *selector1 = @"method1";
    NSString *selector2 = @"method2";
    NSString *selector3 = @"method3:";
    NSString *selector4 = @"method4";
    NSString *selector5 = @"method5";
    NSString *selector6 = @"method6:";
    NSArray *result = @[selector1, selector2, selector3, selector4, selector5, selector6];
    
    for (int i = 0; i < result.count; i++) {
        STAssertTrue([test containsObject:result[i]], @"class should have selector %@", result[i]);
    }
}

- (void)testProtocols
{
    NSArray *test = [[self.childTestObject class] protocols];
    
    NSString *protocol1 = @"NSCopying";
    NSString *protocol2 = @"NSCacheDelegate";
    NSArray *result = @[protocol1, protocol2];
    
    STAssertEquals(test.count, result.count, @"array should have same length");
    
    for (int i = 0; i < test.count; i++) {
        STAssertEqualObjects([test objectAtIndex:i], [result objectAtIndex:i], @"objects should be equal");
    }
}

- (void)testIVarsOnISVar
{
    NSArray *test = [[ISVar class] iVars];
    
    ISVar *var1 = [ISVar iVarWithName:@"_name" type:@"@\"NSString\""];
    ISVar *var2 = [ISVar iVarWithName:@"_type" type:@"@\"NSString\""];

    NSArray *result = @[var1, var2];
    
    STAssertEquals(test.count, result.count, @"array should have same length");
    
    for (int i = 0; i < test.count; i++) {
        STAssertEqualObjects([test objectAtIndex:i], [result objectAtIndex:i], @"objects should be equal");
    }
}

- (void)testPropertiesOnISVar
{
    NSArray *test = [[ISVar class] properties];
    
    ISVar *property1 = [ISVar iVarWithName:@"name" type:@"T@\"NSString\",C,N,V_name"];
    ISVar *property2 = [ISVar iVarWithName:@"type" type:@"T@\"NSString\",C,N,V_type"];

    NSArray *result = @[property1, property2];
    
    STAssertEquals(test.count, result.count, @"array should have same length");
    
    for (int i = 0; i < test.count; i++) {
        STAssertEqualObjects([test objectAtIndex:i], [result objectAtIndex:i], @"objects should be equal");
    }
}

@end
