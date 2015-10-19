//
//  VAPModel.h
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import "VAPObservable.h"

typedef NS_ENUM(NSUInteger, VAPLoadingStates) {
    VAPLoadingStatesDidFailed,
    VAPLoadingStatesDidUnload,
    VAPLoadingStatesWillLoad,
    VAPLoadingStatesDidLoad,
};

@interface VAPModel : VAPObservable


- (void)loadModel;
- (void)setupLoading;
- (void)performLoading;

@end
