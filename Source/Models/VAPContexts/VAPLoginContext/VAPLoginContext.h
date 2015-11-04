//
//  VAPLoginContext.h
//  
//
//  Created by Aleksandr Vasylchenko on 31.10.15.
//
//

#import "VAPBaseContext.h"

@class VAPUser;

@interface VAPLoginContext : VAPBaseContext

- (instancetype)initWithUser:(VAPUser *)user;

@end
