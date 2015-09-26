//
//  UITableView+VAPExtensions.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "UITableView+VAPExtensions.h"
#import "UINib+VAPExtensions.h"

@implementation UITableView (VAPExtensions)

- (id)dequeueCellWithClass:(Class)cls {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass(cls)];
    
    return [nib instantiateCellWithClass:cls];
}

@end
