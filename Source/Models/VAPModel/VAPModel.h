//
//  VAPModel.h
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import "VAPObservable.h"

typedef NS_ENUM(NSUInteger, VAPLoadingStates) {
    VAPLoadingStatesWillLoad,
    VAPLoadingStatesDidLoad,
    VAPLoadingStatesLoading
};

@interface VAPModel : VAPObservable

- (void)processLoadingWithState:(VAPLoadingStates)state;

@end
