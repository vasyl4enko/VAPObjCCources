//
//  VAPRandomStringCell.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRandomStringCell.h"
#import "VAPData.h"

@implementation VAPRandomStringCell

#pragma mark -
#pragma mark Accessors

- (void)setSlowpokeData:(VAPData *)slowpokeData {
    if (_slowpokeData != slowpokeData) {
        _slowpokeData = slowpokeData;
        
        [self fillWithData:_slowpokeData];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithData:(VAPData *)data {
    self.sloupokImage.image = data.image;
    self.sloupokLabel.text = data.name;
}

@end
