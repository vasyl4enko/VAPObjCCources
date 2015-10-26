//
//  VAPCache.m
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPCache.h"

@interface VAPCache ()
@property (nonatomic, strong)   NSMapTable  *mapTable;

@end

@implementation VAPCache

#pragma mark -
#pragma mark Class Methods

+ (VAPCache *)sharedChache {
    static VAPCache *__cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __cache = [[VAPCache alloc] init];
    });
    
    return __cache;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mapTable = [NSMapTable strongToWeakObjectsMapTable];
    }
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object withKey:(id)key {
    @synchronized(self) {
        [self.mapTable setObject:object forKey:key];
    }
}

- (void)removeObjectWithKey:(id)key {
    @synchronized(self) {
        [self.mapTable removeObjectForKey:key];
    }
}

- (BOOL)containsObjecWithKey:(id)key {
    @synchronized(self) {
        return [self.mapTable objectForKey:key];
    }
}

@end
