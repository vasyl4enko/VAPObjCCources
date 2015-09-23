//
//  VAPRandomStringViewController.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 19.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VAPDataArray.h"
#import "VAPDataArrayObserver.h"

@interface VAPRandomStringViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, VAPDataArrayObserver>
@property (nonatomic, strong)   VAPDataArray                            *dataArray;
@property (nonatomic, assign)   UITableViewCellEditingStyle             styleDelete;

@end
