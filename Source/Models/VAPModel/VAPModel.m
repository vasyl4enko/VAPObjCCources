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


#pragma mark -
#pragma mark Public

- (void)loadModel {
    @synchronized(self) {
        VAPLoadingStates state = self.state;
        if (VAPLoadingStatesDidLoad == state || VAPLoadingStatesWillLoad == state) {
            [self notifyObserversWithSelector:[self selectorWithState:self.state]];
            
            return;
        }
    }
    
    [self setupLoading];
    
    VAPWeakify(self);
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        VAPStrongifyAndReturnIfNil(self);
        [self performLoading];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            self.state = VAPLoadingStatesDidLoad;
        });
    });
}

- (void)setupLoading {
    self.state = VAPLoadingStatesWillLoad;
}

- (void)performLoading {
    
}

#pragma mark -
#pragma mark Private Methods

- (SEL)selectorWithState:(NSInteger)state {
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
            
            case VAPLoadingStatesDidChange:
            selector = @selector(model:didChangeWithChangesModel:);
            break;
            
        default:
            [super selectorWithState:state];
            break;
    }
    
    return selector;
}

@end
