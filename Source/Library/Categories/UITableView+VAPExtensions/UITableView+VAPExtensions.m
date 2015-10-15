//
//  UITableView+VAPExtensions.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 26.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "UITableView+VAPExtensions.h"

#import "UINib+VAPExtensions.h"
#import "NSIndexPath+VAPExtensions.h"

#import "VAPChangesModel.h"
#import "VAPChangesModelOneIndex.h"
#import "VAPChangesModelTwoIndexes.h"

#import "VAPChangesModel+UITableView.h"

@implementation UITableView (VAPExtensions)

- (id)dequeueCellWithClass:(Class)cls {
    return [UINib objectWithClass:cls];
}

- (void)updateModelWithChangesModel:(VAPChangesModel *)changesModel {
    [self updateModelWithChangesModel:changesModel withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)updateModelWithChangesModel:(VAPChangesModel *)changesModel
                   withRowAnimation:(UITableViewRowAnimation)rowAnimation
{
    UITableView *tableView = self;
    [tableView beginUpdates];
    [changesModel applyToTableView:tableView];
    [tableView endUpdates];
}

@end
