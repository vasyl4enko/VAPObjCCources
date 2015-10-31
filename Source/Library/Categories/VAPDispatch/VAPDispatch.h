//
//  VAPDispatch.h
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import <Foundation/Foundation.h>

@interface VAPDispatch : NSObject

void VAPDispatchAsyncOnBackgroundThread(void(^block)(void));
void VAPDispatchAsyncOnMainThread(void(^block)(void));

@end
