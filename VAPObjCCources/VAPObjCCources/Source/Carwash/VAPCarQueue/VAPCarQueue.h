//
//  VAPCarQueue.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 12.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPCar;

@interface VAPCarQueue : NSObject

- (VAPCar *)dequeue;
- (BOOL)isFull;

@end
