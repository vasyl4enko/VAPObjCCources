//
//  VAPModelObserver.h
//  
//
//  Created by Aleksandr Vasylchenko on 11.10.15.
//
//

#import <Foundation/Foundation.h>

@protocol VAPModelObserver <NSObject>

@optional
- (void)modelWillLoad:(id)object;
- (void)modelDidLoad:(id)object;
- (void)modelDidFail:(id)object;
- (void)modelDidUnload:(id)object;
- (void)model:(id)object didChangeWithChangesModel:(id)model;

@end
