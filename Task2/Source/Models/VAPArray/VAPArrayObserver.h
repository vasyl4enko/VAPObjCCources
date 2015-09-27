//
//  VAPArrayObserver.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPDataArray;

@protocol VAPArrayObserver <NSObject>
@optional
- (void)dataArrayDidChanged:(VAPDataArray *)object modelChanges:(id)model;

@end
