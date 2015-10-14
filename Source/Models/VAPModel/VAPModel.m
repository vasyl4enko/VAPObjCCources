//
//  VAPModel.m
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import "VAPModel.h"

#import "VAPModelObserver.h"

@interface VAPModel ()
@property (nonatomic, readwrite) VAPLoadingStates state;

- (SEL)selectorWithState:(VAPLoadingStates)state;

@end

@implementation VAPModel


#pragma mark -
#pragma mark Accessors

- (void)setState:(VAPLoadingStates)state {
    if (_state != state) {
        _state = state;
        [self notifyLoadedModelWithSelector:[self selectorWithState:_state]];
    }
}

#pragma mark -
#pragma mark Public

- (void)loadModel {
    VAPLoadingStates state = self.state;
    if (VAPLoadingStatesDidLoad == state || VAPLoadingStatesWillLoad == state) {
        [self notifyLoadedModelWithSelector:[self selectorWithState:_state]];
        
        return;
    }
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
            selector = @selector(modelDidFailed:);
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
