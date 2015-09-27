//
//  VAPChangesModelTwoIndexes.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPChangesModelTwoIndexes.h"

@interface VAPChangesModelTwoIndexes ()
@property (nonatomic, strong)   NSIndexPath     *indexTo;
@property (nonatomic, strong)   NSIndexPath     *indexFrom;
@property (nonatomic, assign)   VAPArrayStates  state;

@end

@implementation VAPChangesModelTwoIndexes

- (instancetype)initWithFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex state:(VAPArrayStates)state {
    self = [super init];
    if (self) {
        self.state = state;
        self.indexFrom = [NSIndexPath indexPathForRow:fromIndex inSection:0];
        self.indexTo = [NSIndexPath indexPathForRow:toIndex inSection:0];
    }
    
    return self;
}

- (VAPArrayStates)arrayState {
    return self.state;
}

- (NSIndexPath *)toIndex {
    return self.indexTo;
}

- (NSIndexPath *)fromIndex {
    return self.indexFrom;
}

@end
