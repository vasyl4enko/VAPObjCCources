//
//  VAPImageView.m
//  
//
//  Created by Aleksandr Vasylchenko on 28.10.15.
//
//

#import "VAPImageView.h"

#import "VAPModel.h"

#import "VAPImageModel.h"

#import "VAPMacros.h"

@implementation VAPImageView

#pragma mark -
#pragma mark Accessors

- (void)setDogeImageModel:(id)dogeImageModel {
    VAPSynthesizeObservingSetter(dogeImageModel);
    [self fillWithContent:dogeImageModel];
    [dogeImageModel loadModel];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithContent:(VAPImageModel *)content {
    self.imageView.image = content.image;
}

#pragma mark -
#pragma mark Model Obsrverver

- (void)modelWillLoad:(id)object {
}

- (void)modelDidFail:(id)object {
    [self.dogeImageModel loadModel];
}

- (void)modelDidLoad:(id)object {
    [self fillWithContent:object];
}
@end
