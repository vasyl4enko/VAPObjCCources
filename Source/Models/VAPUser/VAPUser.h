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
@property (nonatomic, copy)         NSString        *ID;
@property (nonatomic, copy)         NSString        *name;
@property (nonatomic, strong)       NSString        *imageURL;
@property (nonatomic, strong)       VAPArray        *friends;
@property (nonatomic, readonly)     VAPImageModel   *imageModel;

@end
