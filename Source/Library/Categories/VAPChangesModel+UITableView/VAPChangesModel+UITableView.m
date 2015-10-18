//
//  VAPChangesModel+UITableView.m
//  
//
//  Created by Aleksandr Vasylchenko on 15.10.15.
//
//

#import "VAPChangesModel+UITableView.h"

#import "VAPChangesModelOneIndex.h"
#import "VAPChangesModelTwoIndexes.h"

@implementation VAPChangesModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView{
    [self applyToTableView:tableView rowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    
}

@end

@implementation VAPChangesModelOneIndex (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    switch (self.state) {
        case VAPArrayStatesDelete:
            [tableView deleteRowsAtIndexPaths:@[self.targetIndexPath] withRowAnimation:rowAnimation];
            break;
            
        case VAPArrayStatesInsert:
            [tableView insertRowsAtIndexPaths:@[self.targetIndexPath] withRowAnimation:rowAnimation];
            break;
            
        default:
            break;
    }
}

@end

@implementation VAPChangesModelTwoIndexes (UITableView)

- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation {
    [tableView moveRowAtIndexPath:self.sourceIndexPath toIndexPath:self.targetIndexPath];
}

@end
