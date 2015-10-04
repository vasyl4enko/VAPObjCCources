//
//  UINib+VAPExtensions.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (VAPExtensions)

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundleOrNil;

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls owner:(id)ownerOrNil;
+ (id)objectWithClass:(Class)cls owner:(id)ownerOrNil bundle:(NSBundle *)bundleOrNil;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)ownerOrNil;

@end
