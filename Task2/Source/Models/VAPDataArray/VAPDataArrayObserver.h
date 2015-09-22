//
//  VAPDataArrayObserver.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 23.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPDataArray;

@protocol VAPDataArrayObserver <NSObject>

- (void)dataArrayRemoveObject:(VAPDataArray *)dataArray atIndex:(NSUInteger)index;

@end
