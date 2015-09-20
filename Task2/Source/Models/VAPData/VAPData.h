//
//  VAPData.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface VAPData : NSObject
@property (nonatomic, readonly)     NSString    *name;
@property (nonatomic, readonly)     NSURL       *url;
@property (nonatomic, readonly)     UIImage     *image;

@end
