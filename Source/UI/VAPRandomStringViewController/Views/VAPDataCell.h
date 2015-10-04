//
//  VAPDataCell.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VAPData;

@interface VAPDataCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *cellLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *contentImage;

@property (nonatomic, strong)   VAPData                 *content;

- (void)fillWithContent:(VAPData *)content;

@end
