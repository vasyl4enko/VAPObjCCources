//
//  VAPUser.h
//  
//
//  Created by Aleksandr Vasylchenko on 01.11.15.
//
//

#import "VAPModel.h"

@class VAPImageModel;
@class VAPArray;

@interface VAPUser : VAPModel
@property (nonatomic, copy)     NSString    *ID;
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, strong)   NSURL       *photo;
@property (nonatomic, strong)   VAPArray    *friends;

@end
