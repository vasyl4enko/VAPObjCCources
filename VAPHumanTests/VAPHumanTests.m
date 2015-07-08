//
//  VAPHumanTests.m
//  VAPHumanTests
//
//  Created by Aleksandr Vasylchenko on 08.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "VAPHuman.h"
#import "VAPMan.h"
#import "VAPWoman.h"

@interface VAPHumanTests : XCTestCase

@end

@implementation VAPHumanTests

- (void)setUp {
    [super setUp];


}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
