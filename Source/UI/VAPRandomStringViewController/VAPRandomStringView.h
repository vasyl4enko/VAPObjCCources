//
//  VAPRandomStringView.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 19.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VAPLoadingView;

@interface VAPRandomStringView : UIView
@property (nonatomic, strong)                                       IBOutlet UITableView        *tableView;
@property (nonatomic, readonly, getter = isLoadingViewHidden)       BOOL                        loadingViewHidden;

- (void)showLoadingView;
- (void)hideLoadingView;

- (id)newLoadingView;

@end
