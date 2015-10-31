//
//  VAPCache.h
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import <Foundation/Foundation.h>

@interface VAPCache : NSObject

+ (VAPCache *)sharedChache;

- (void)addObject:(id)object withKey:(id)key;
- (void)removeObjectWithKey:(id)key;
- (id)objectForKey:(id)key;
- (BOOL)containsObjecWithKey:(id)key;

@end
