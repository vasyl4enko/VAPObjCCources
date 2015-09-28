//
//  VAPChangesModelOneIndex.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModelOneIndex.h"

@interface VAPChangesModelOneIndex ()
@property (nonatomic, strong)   NSIndexPath     *index;
@property (nonatomic, assign)   VAPArrayStates  state;

@end

@implementation VAPChangesModelOneIndex

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFromIndex:(NSUInteger)index state:(VAPArrayStates)state {
    self = [super init];
    if (self) {
        self.state = state;
        self.index = [NSIndexPath indexPathForRow:index inSection:0];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (VAPArrayStates)arrayState {
    return self.state;
}

- (NSIndexPath *)toIndex {
    return nil;
}

- (NSIndexPath *)fromIndex {
    return self.index;
}

@end
