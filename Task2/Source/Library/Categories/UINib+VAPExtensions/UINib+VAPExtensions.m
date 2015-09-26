//
//  UINib+VAPExtensions.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "UINib+VAPExtensions.h"

@implementation UINib (VAPExtensions)


+ (UINib *)nibWithNibName:(NSString *)name {
    return [self nibWithNibName:name bundle:nil];
}

- (NSArray *)instantiateWithClass:(Class)cls {
    return [self instantiateWithClass:cls owner:nil];
}

- (NSArray *)instantiateWithClass:(Class)cls owner:(id)ownerOrNil {
    UINib *nib = [[self class] nibWithNibName:NSStringFromClass(cls)];
    
    return [nib instantiateWithOwner:ownerOrNil options:nil];
}

- (id)instantiateCellWithClass:(Class)cls {
    return [self instantiateCellWithClass:cls owner:nil];

}

- (id)instantiateCellWithClass:(Class)cls owner:(id)ownerOrNil {
    NSArray *objects = [self instantiateWithClass:cls owner:ownerOrNil];
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
