//
//  VAPAccountant.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPAccountant.h"

NSString *const kAccuntantGreeting = @"I'm an accountan";
NSUInteger const kDefualtSendingToDirector = 200;

@implementation VAPAccountant

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    NSLog(kAccuntantGreeting);
    
    if (nil != object && [object isKindOfClass:[NSNumber class]]) {
        self.wallet += [object integerValue];
        if ([self isObjectAbleToPay:kDefualtSendingToDirector]) {
            [self payMoneyToReciver:self.receiver price:self.wallet];
            self.wallet = 0;
            self.busy = NO;
        }
    }

}

- (BOOL)isObjectAbleToPay:(NSUInteger)money {
    return self.wallet >= money;
}
- (void)payMoneyToReciver:(id<VAPMoneyFlowing>)object price:(NSUInteger)money {
    NSNumber *objectMoney = [[[NSNumber alloc] initWithInteger:money] autorelease];
    if ([object respondsToSelector:@selector(performEmployeeSpecificOperationWithObject:)]){
        [object performSelector:@selector(performEmployeeSpecificOperationWithObject:) withObject:objectMoney];
    }
}

@end
