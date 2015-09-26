//
//  UINib+VAPExtensions.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (VAPExtensions)

+ (UINib *)nibWithNibName:(NSString *)name;

- (NSArray *)instantiateWithClass:(Class)cls;
- (NSArray *)instantiateWithClass:(Class)cls owner:(id)ownerOrNil;

- (id)instantiateViewWithClass:(Class)cls;
- (id)instantiateViewWithClass:(Class)cls owner:(id)ownerOrNil;

@end
