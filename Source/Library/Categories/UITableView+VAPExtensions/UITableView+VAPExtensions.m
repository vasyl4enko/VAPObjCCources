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

@implementation UITableView (VAPExtensions)

- (id)dequeueCellWithClass:(Class)cls {
    return [UINib objectWithClass:cls];
}

- (void)changeModelWithChangesModel:(id)model {
    UITableView *tableView = self;
    VAPChangesModelOneIndex *modelOneIndex = nil;
    VAPChangesModelTwoIndexes *modelTwoIndexes = nil;
    
    switch ([model state]) {
        case VAPArrayStatesDelete:
            modelOneIndex = model;
            [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:modelOneIndex.index]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case VAPArrayStatesInsert:
            modelOneIndex = model;
            [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:modelOneIndex.index]]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case VAPArrayStatesMove:
            modelTwoIndexes = model;
            [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:modelTwoIndexes.fromIndex]
                              toIndexPath:[NSIndexPath indexPathForRow:modelTwoIndexes.toIndex]];
            break;

        default:
            break;
    }
}

@end
