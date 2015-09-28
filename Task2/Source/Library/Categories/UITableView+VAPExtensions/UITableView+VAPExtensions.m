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

@implementation UITableView (VAPExtensions)

- (id)dequeueCellWithClass:(Class)cls {
    UINib *nib = [UINib nibWithClass:cls];
    
    return [nib objectWithClass:cls];
}

- (void)changeModelWithChangesModel:(VAPChangesModel *)model {
    UITableView *tableView = self;
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:model.fromIndex.row]];
    switch (model.arrayState) {
        case VAPArrayStatesDelete:
            [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case VAPArrayStatesInsert:
            [tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case VAPArrayStatesMove:
            [tableView moveRowAtIndexPath:model.fromIndex toIndexPath:model.toIndex];
            break;
            
        default:
            break;
    }
}

@end
