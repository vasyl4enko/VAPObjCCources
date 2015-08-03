//
//  VAPDirector.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 13.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEmployee.h"
#import "VAPAccountant.h"

@interface VAPDirector : VAPEmployee<VAPMoneyFlowingDelegate>
@property(nonatomic, retain)    VAPAccountant       *delegatingObject;
@end
