//
//  ISTestObject.m
//  Introspecta
//
//  Created by Alberto De Bortoli on 12/21/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "ISTestObject.h"

@implementation ISTestObject

@synthesize property1 = _ivar1;
@synthesize property2 = _ivar2;
@synthesize property3 = _ivar3;
@synthesize property4 = _ivar4;

- (void)method1
{
    NSLog(@"method1");
}

- (NSString *)method2
{
    NSLog(@"method2");
    return @"method2";
}

- (NSString *)method3:(NSArray *)list
{
    NSLog(@"method3");
    return @"method3";
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end
