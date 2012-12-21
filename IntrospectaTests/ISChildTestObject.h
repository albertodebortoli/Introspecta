//
//  ISChildTestObject.h
//  Introspecta
//
//  Created by Alberto De Bortoli on 12/21/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import "ISTestObject.h"

@interface ISChildTestObject : ISTestObject <NSCacheDelegate> {
    
    NSString *_ivar5;
    NSNumber *_ivar6;
    NSInteger _ivar7;
    BOOL _ivar8;
}

- (void)method4;
- (NSString *)method5;
- (NSString *)method6:(NSArray *)list;

@property (nonatomic, copy) NSString *property5;
@property (nonatomic, strong) NSNumber *property6;
@property (nonatomic, unsafe_unretained) NSInteger property7;
@property (nonatomic, assign) BOOL property8;

@end
