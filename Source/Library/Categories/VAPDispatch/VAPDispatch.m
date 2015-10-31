//
//  VAPDispatch.m
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPDispatch.h"

@implementation VAPDispatch

void VAPDispatchAsyncOnBackgroundThread(void(^block)(void)) {
    if(block) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block);
    }
}

void VAPDispatchAsyncOnMainThread(void(^block)(void)) {
    if (block) {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}



@end
