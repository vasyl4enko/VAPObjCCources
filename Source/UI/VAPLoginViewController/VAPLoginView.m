//
//  VAPLoginView.m
//  
//
//  Created by Aleksandr Vasylchenko on 31.10.15.
//
//

#import "VAPLoginView.h"

#import "VAPMacros.h"
#import "VAPUser.h"

@implementation VAPLoginView

#pragma mark -
#pragma mark Accessors

- (void)setUser:(VAPUser *)user {
    VAPSynthesizeObservingSetter(user);
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithContent:(VAPUser *)user {
    self.contentImageView.imageModel = user.imageModel;
    self.fullNameLabel.text = user.name;
}

#pragma mark -
#pragma mark Model Observer

- (void)modelDidLoad:(id)object {
    [self fillWithContent:object];
}

@end
