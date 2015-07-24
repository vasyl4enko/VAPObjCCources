//
//  VAPMoneyFlowing.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 22.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//


//(1) можешь ли заплатить, 2) заплатить деньги, 3) получить деньги)

#import <Foundation/Foundation.h>

@protocol VAPMoneyFlowing <NSObject>

- (BOOL)isObjectAbleToPay;
- (void)payMoney:(id<VAPMoneyFlowing>)object;
- (void)sendMoney;

@end
