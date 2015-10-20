//
//  VAPModel.h
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import "VAPObservable.h"

typedef NS_ENUM(NSInteger, VAPLoadingStates) {
    VAPLoadingStatesDidFailed = -1,
    VAPLoadingStatesDidUnload,
    VAPLoadingStatesWillLoad,
    VAPLoadingStatesDidLoad,
    VAPLoadingStatesDidChange
};

@interface VAPModel : VAPObservable

- (void)loadModel;
- (void)setupLoading;
- (void)performLoading;

@end
