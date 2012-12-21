//
//  IntrospectaTests.h
//  IntrospectaTests
//
//  Created by Alberto De Bortoli on 12/19/12.
//  Copyright (c) 2012 Alberto De Bortoli. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "ISChildTestObject.h"
#import "NSObject+Introspecta.h"
#import "ISVar.h"

@interface IntrospectaTests : SenTestCase

@property (nonatomic, strong) ISTestObject *testObject;
@property (nonatomic, strong) ISChildTestObject *childTestObject;

@end
