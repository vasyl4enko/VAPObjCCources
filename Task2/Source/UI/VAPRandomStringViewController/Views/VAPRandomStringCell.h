//
//  VAPRandomStringCell.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VAPData;

@interface VAPRandomStringCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *sloupokLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *sloupokImage;

@property (nonatomic, strong)   VAPData                 *slowpokeData;

- (void)fillWithData:(VAPData *)data;

@end
