//
//  VAPMoneyFlowing.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 22.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//




#import <Foundation/Foundation.h>

@protocol VAPMoneyFlowing <NSObject>
@property(nonatomic, assign) NSUInteger wallet;

- (BOOL)isObjectAbleToPay:(NSUInteger)money;
- (void)payMoneyToReciver:(id<VAPMoneyFlowing>)object price:(NSUInteger)money;

@end
