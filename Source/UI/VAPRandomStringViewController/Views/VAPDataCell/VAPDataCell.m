//
//  VAPDataCell.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDataCell.h"
#import "VAPData.h"

@implementation VAPDataCell

#pragma mark -
#pragma mark Accessors

- (void)setContent:(VAPData *)content {
    if (_content != content) {
        _content = content;
        
        [self fillWithContent:_content];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithContent:(VAPData *)content {
    self.contentImage.image = content.image;
    self.cellLabel.text = content.name;
}

@end
