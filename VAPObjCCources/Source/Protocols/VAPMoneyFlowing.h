//
//  VAPMoneyFlowing.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 04.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VAPMoneyFlowing <NSObject>

@property(atomic, assign)    NSUInteger  wallet;

- (BOOL)isAbleToPay:(NSUInteger)cost;
- (void)payTo:(id <VAPMoneyFlowing>)object withCost:(NSUInteger)cost;


@end
