//
//  UITableView+VAPExtensions.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VAPChangesModel;

@interface UITableView (VAPExtensions)

- (id)dequeueCellWithClass:(Class)cls;

- (void)updateModelWithChangesModel:(id)model;

@end
