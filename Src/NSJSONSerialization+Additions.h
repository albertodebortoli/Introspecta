//
//  NSJSONSerialization+Additions.h
//  Introspecta
//
//  Created by Alberto De Bortoli on 12/19/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (Additions)

+ (id)objectFromJSONString:(NSString *)string;
+ (NSString *)JSONFromObject:(id)cocoaObject;

@end
