//
//  VAPModelObserver.h
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import <Foundation/Foundation.h>

@protocol VAPModelObserver <NSObject>

- (void)modelWillLoad:(id)self;
- (void)modelDidLoad:(id)self;
- (void)modelDidFailed:(id)self;
- (void)modelDidUnload:(id)self;

@end
