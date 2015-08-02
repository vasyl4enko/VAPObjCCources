//
//  VAPEmployee.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"

@implementation VAPEmployee

#pragma mark -
#pragma mark Accesors

//- (void)setWallet:(NSUInteger)wallet {
//    if (_wallet != wallet) {
//        if (_wallet <= wallet) {
//            _wallet = wallet;
//           
//            
//        } else {
//            _wallet = wallet;
//            
//        }
//    }
//}

- (void)setWallet:(NSUInteger)wallet {
    id<VAPMoneyFlowingDelegate> delegate = self.delegate;
    if (_wallet != wallet) {
        NSUInteger previousValue = self.wallet;
        _wallet = wallet;
        if (previousValue < wallet) {
            [delegate delegatingEmployeeDidAddMoney:self];
        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)performEmployeeSpecificOperationWithObject:(id) object {
    
}





@end
