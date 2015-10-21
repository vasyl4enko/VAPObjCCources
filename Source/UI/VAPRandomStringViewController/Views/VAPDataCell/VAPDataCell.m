//
//  VAPDataCell.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 20.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPDataCell.h"

#import "VAPData.h"

#import "VAPMacros.h"

@implementation VAPDataCell

#pragma mark -
#pragma mark Accessors

- (void)setContent:(VAPData *)content {
    VAPSynthesizeObservingSetter(content);
    [self fillWithContent:_content];
    [_content loadModel];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithContent:(VAPData *)content {
    self.contentImage.image = content.image;
    self.cellLabel.text = content.name;
}

#pragma mark -
#pragma mark VAPModelObserver

- (void)modelWillLoad:(id)object {
    
}

- (void)modelDidLoad:(id)object {
    [self fillWithContent:object];
}

- (void)modelDidFail:(id)object {
    [self.content loadModel];
}

@end
