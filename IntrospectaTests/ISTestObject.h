//
//  ISTestObject.h
//  Introspecta
//
//  Created by Alberto De Bortoli on 12/21/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISTestObject : NSObject <NSCopying> {
    
    NSString *_ivar1;
    NSNumber *_ivar2;
    NSInteger _ivar3;
    BOOL _ivar4;
}

- (void)method1;
- (NSString *)method2;
- (NSString *)method3:(NSArray *)list;

@property (nonatomic, copy) NSString *property1;
@property (nonatomic, strong) NSNumber *property2;
@property (nonatomic, unsafe_unretained) NSInteger property3;
@property (nonatomic, assign) BOOL property4;

@end
