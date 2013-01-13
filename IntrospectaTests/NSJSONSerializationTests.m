//
//  NSJSONSerializationTests.m
//  Introspecta
//
//  Created by Alberto De Bortoli on 1/13/13.
//  Copyright (c) 2013 Alberto De Bortoli. All rights reserved.
//

#import "NSJSONSerializationTests.h"
#import "NSJSONSerialization+Introspecta.h"

@implementation NSJSONSerializationTests

- (void)setUp
{
    [super setUp];
    
    array = @[ @"value1", @"value2" ];
    dictionary = @{ @"key1" : @"value1", @"key2" : @"value2" };
    arrayString = @"[\"value1\",\"value2\"]";
    dictionaryString = @"{\"key2\":\"value2\",\"key1\":\"value1\"}";
}

- (void)tearDown
{
    array = nil;
    dictionary = nil;
    arrayString = nil;
    dictionaryString = nil;
    
    [super tearDown];
}

- (void)testThatJSONSerializationParseArrayStrings
{
    NSArray *result = [NSJSONSerialization objectFromJSONString:arrayString];
    STAssertEqualObjects(result, array, @"objects should be equal");
}


- (void)testThatJSONSerializationParseDictionaryStrings
{
    NSArray *result = [NSJSONSerialization objectFromJSONString:dictionaryString];
    STAssertEqualObjects(result, dictionary, @"objects should be equal");
}

- (void)testThatJSONSerializationConvertArrayToString
{
    NSString *result = [NSJSONSerialization JSONFromObject:array];
    STAssertEqualObjects(arrayString, result, @"objects should be equal");
}

- (void)testThatJSONSerializationConvertDictionaryToString
{
    NSString *result = [NSJSONSerialization JSONFromObject:dictionary];
    STAssertEqualObjects(dictionaryString, result, @"objects should be equal");
}

@end
