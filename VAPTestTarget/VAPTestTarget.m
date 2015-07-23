//
//  VAPTestTarget.m
//  VAPTestTarget
//
//  Created by Aleksandr Vasylchenko on 22.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Kiwi/Kiwi.h>

SPEC_BEGIN(VAPExample)

describe(@"example", ^{
    context(@"nsobject", ^{
        NSObject *object = [NSObject new];
        it(@"it should be kind of class", ^{
            [[object should] beKindOfClass:[NSObject class]];
        });
    });
});

SPEC_END