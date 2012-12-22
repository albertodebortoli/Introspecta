//
//  NSJSONSerialization+Introspecta.m
//  Introspecta
//
//  Created by Alberto De Bortoli on 12/19/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "NSJSONSerialization+Introspecta.h"

@implementation NSJSONSerialization (Introspecta)

+ (id)objectFromJSONString:(NSString *)jsonString
{
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    
    NSAssert(error == nil, @"Can't parse JSON");
    return jsonObject;
}

+ (NSString *)JSONFromObject:(id)cocoaObject
{
    NSAssert([cocoaObject isKindOfClass:[NSDictionary class]] || [cocoaObject isKindOfClass:[NSArray class]], @"cocoaObject is not NSDictionary or NSArray, is: %@,", NSStringFromClass([cocoaObject class]));
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:cocoaObject options:kNilOptions error:&error];
    
    NSAssert(error == nil, @"Can't parse JSON");
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
