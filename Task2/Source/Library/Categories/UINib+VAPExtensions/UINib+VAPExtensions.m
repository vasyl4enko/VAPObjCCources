//
//  UINib+VAPExtensions.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "UINib+VAPExtensions.h"

@implementation UINib (VAPExtensions)

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundleOrNil {
    return [self nibWithNibName:NSStringFromClass(cls) bundle:bundleOrNil];;
}

+ (id)objectWithClass:(Class)cls {
    return nil;
}

+ (id)objectWithClass:(Class)cls owner:(id)ownerOrNil {
    return nil;
}

+ (id)objectWithClass:(Class)cls owner:(id)ownerOrNil bundle:(NSBundle *)bundleOrNil {
    UINib *nib = [UINib nibWithClass:cls];
    
    return nil;
}

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls owner:nil];;
}

- (id)objectWithClass:(Class)cls owner:(id)ownerOrNil {
    NSArray *objects = [self instantiateWithOwner:ownerOrNil options:nil];
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}


@end
