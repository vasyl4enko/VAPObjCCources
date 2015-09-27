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

- (instancetype)initWithFromIndex:(NSUInteger)index state:(VAPArrayStates)state {
    self = [super init];
    if (self) {
        self.state = state;
        self.index = [NSIndexPath indexPathForRow:index inSection:0];
    }
    
    return self;
}

- (VAPArrayStates)arrayState {
    return self.state;
}

- (NSIndexPath *)toIndex {
    return self.index;
}

- (NSIndexPath *)fromIndex {
    return nil;
}

@end
