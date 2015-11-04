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

@end
