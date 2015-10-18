//
//  VAPModel.m
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import "VAPModel.h"

#import "VAPModelObserver.h"

#import "VAPMacros.h"

@implementation VAPModel

#pragma mark -
#pragma mark Accessors

- (void)setState:(VAPLoadingStates)state {
    if (_state != state) {
        _state = state;
        [self notifyLoadedModelWithSelector:[self selectorWithState:state]];
    }
}

#pragma mark -
#pragma mark Public

- (void)loadModel {
    VAPLoadingStates state = self.state;
    if (VAPLoadingStatesDidLoad == state || VAPLoadingStatesWillLoad == state) {
        [self notifyLoadedModelWithSelector:[self selectorWithState:self.state]];
        
        return;
    }
    
    [self setupLoading];
    
    VAPWeakify(self);
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        VAPStrongifyAndReturnIfNil(self);
        [self performLoading];
        dispatch_sync(dispatch_get_main_queue(), ^(void){
            self.state = VAPLoadingStatesDidLoad;
        });
    });
}

- (void)setupLoading {
    
}

- (void)performLoading {
    
}

#pragma mark -
#pragma mark Private Methods

- (SEL)selectorWithState:(VAPLoadingStates)state {
    SEL selector = nil;
    switch (state) {
        case VAPLoadingStatesWillLoad:
            selector = @selector(modelWillLoad:);
            break;
            
        case VAPLoadingStatesDidLoad:
            selector = @selector(modelDidLoad:);
            break;
            
        case VAPLoadingStatesDidUnload:
            selector = @selector(modelDidUnload:);

            break;
        case VAPLoadingStatesDidFailed:
            selector = @selector(modelDidFail:);
            break;
            
        default:
            break;
    }
    
    return selector;
}

- (void)notifyLoadedModelWithSelector:(SEL)selector {
    [self notifyObserversWithSelector:selector withObject:self];
}

@end
