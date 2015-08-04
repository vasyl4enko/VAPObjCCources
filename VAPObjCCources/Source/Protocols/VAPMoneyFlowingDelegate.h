//
//  VAPMoneyFlowingDelegate.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 04.08.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VAPMoneyFlowingDelegate <NSObject>

- (void)delegatingEmployeeDidAddMoney:(VAPEmployee *)employee;

@end
