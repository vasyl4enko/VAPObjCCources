//
//  VAPArrayObserver.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 27.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAPArray;
@class VAPChangesModel;

@protocol VAPArrayObserver <NSObject>
@optional
- (void)dataArray:(id)object didChangeWithChangesModel:(id)model;

@end
