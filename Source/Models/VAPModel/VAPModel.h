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
};

@interface VAPModel : VAPObservable
@property (nonatomic, assign)     VAPLoadingStates    state;

- (void)loadModel;
- (void)setupLoading;
- (void)performLoading;

- (SEL)selectorWithState:(VAPLoadingStates)state;

@end
