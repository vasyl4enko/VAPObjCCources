//
//  VAPDataCell.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPTableViewCell.h"

#import "VAPImageView.h"

@class VAPData;

@interface VAPDataCell : VAPTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel                    *cellLabel;
@property (nonatomic, strong)   IBOutlet VAPImageView               *dogeImageView;

@property (nonatomic, strong)   VAPData                             *content;

- (void)fillWithContent:(VAPData *)content;

@end
