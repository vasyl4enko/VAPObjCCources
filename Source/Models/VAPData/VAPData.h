//
//  VAPData.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VAPModel.h"

@class VAPImageModel;

@interface VAPData : VAPModel <NSCoding>
@property (nonatomic, readonly)     NSString            *name;
@property (nonatomic, readonly)     NSURL               *url;
@property (nonatomic, readonly)     VAPImageModel       *image;

@end
