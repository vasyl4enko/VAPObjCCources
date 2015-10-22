//
//  VAPDataCell.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPTableViewCell.h"

@class VAPData;

@interface VAPDataCell : VAPTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *cellLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *contentImage;
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView *spiner;

@property (nonatomic, strong)   VAPData                 *content;

- (void)fillWithContent:(VAPData *)content;

@end
