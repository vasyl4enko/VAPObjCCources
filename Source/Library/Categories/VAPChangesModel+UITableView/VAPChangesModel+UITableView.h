//
//  VAPChangesModel+UITableView.h
//  
//
//  Created by Aleksandr Vasylchenko on 15.10.15.
//
//

#import "VAPChangesModel.h"

@interface VAPChangesModel (UITableView)

- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView rowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
