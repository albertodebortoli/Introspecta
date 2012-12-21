//
//  ISChildTestObject.m
//  Introspecta
//
//  Created by Alberto De Bortoli on 12/21/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "ISChildTestObject.h"

@implementation ISChildTestObject

@synthesize property5 = _ivar5;
@synthesize property6 = _ivar6;
@synthesize property7 = _ivar7;
@synthesize property8 = _ivar8;

- (void)method4
{
    NSLog(@"method4");
}

- (NSString *)method5
{
    NSLog(@"method5");
    return @"method5";
}

- (NSString *)method6:(NSArray *)list
{
    NSLog(@"method6");
    return @"method6";
}

@end
