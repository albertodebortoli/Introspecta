//
//  ISVarTests.m
//  Introspecta
//
//  Created by Alberto De Bortoli on 1/13/13.
//  Copyright (c) 2013 Alberto De Bortoli. All rights reserved.
//

#import "ISVarTests.h"
#import "ISVar.h"

@implementation ISVarTests

- (void)setUp
{
    [super setUp];
    object = [[ISVar alloc] initWithName:@"name" type:@"type"];
}

- (void)tearDown
{
    object = nil;
    [super tearDown];
}

- (void)testThatISVarIsEqualReturnsYESForEqualObjects
{
    ISVar *secondObject = [[ISVar alloc] initWithName:@"name" type:@"type"];
    
    STAssertTrue([object isEqual:secondObject], @"objects should be equal");
}

- (void)testThatISVarIsEqualReturnsNOForISVarObjectsWithDifferentNames
{
    ISVar *secondObject = [[ISVar alloc] initWithName:@"different name" type:@"type"];
    
    STAssertFalse([object isEqual:secondObject], @"objects should not be equal");
}

- (void)testThatISVarIsEqualReturnsNOForISVarObjectsWithDifferentTypes
{
    ISVar *secondObject = [[ISVar alloc] initWithName:@"name" type:@"different type"];
    
    STAssertFalse([object isEqual:secondObject], @"objects should not be equal");
}

- (void)testThatISVarIsEqualReturnsNOForISVarObjectsWithDifferentNamesAndTypes
{
    ISVar *secondObject = [[ISVar alloc] initWithName:@"different name" type:@"different type"];
    
    STAssertFalse([object isEqual:secondObject], @"objects should not be equal");
}

- (void)testThatISVarIsEqualReturnsNOForNonISVarObjectsOrNil
{
    NSString *secondObject = @"different name";
    
    STAssertFalse([object isEqual:secondObject], @"objects should not be equal");
    STAssertFalse([object isEqual:nil], @"objects should not be equal");
}

- (void)testThatISVarDescriptionContainsNameAndType
{
    NSString *description = [object description];
    
    STAssertTrue([description rangeOfString:object.name].location != NSNotFound, @"ISVar description should contain name");
    STAssertTrue([description rangeOfString:object.type].location != NSNotFound, @"ISVar description should contain type");
}

- (void)testThatNameGetterIsOk
{
    STAssertEqualObjects([object name], @"name", @"objects should be equal");
}

- (void)testThatNameSetterIsOk
{
    object.name = @"new name";
    
    STAssertEqualObjects([object name], @"new name", @"objects should be equal");
}

- (void)testThatTypeGetterIsOk
{
    STAssertEqualObjects([object type], @"type", @"objects should be equal");
}

- (void)testThatTypeSetterIsOk
{
    object.type = @"new type";
    
    STAssertEqualObjects([object type], @"new type", @"objects should be equal");
}

@end
