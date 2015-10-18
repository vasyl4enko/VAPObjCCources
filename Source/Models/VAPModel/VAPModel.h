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
    VAPLoadingStatesDidUnload,
    VAPLoadingStatesDidFailed
};

@interface VAPModel : VAPObservable
@property (nonatomic, assign)     VAPLoadingStates    state;

- (void)loadModel;

- (SEL)selectorWithState:(VAPLoadingStates)state;

@end
