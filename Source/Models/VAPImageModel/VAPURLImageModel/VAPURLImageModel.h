//
//  VAPURLImageModel.h
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPFileImageModel.h"

@interface VAPURLImageModel : VAPFileImageModel
@property (nonatomic, readonly)                     NSString    *fileFolder;
@property (nonatomic, readonly)                     NSString    *fileName;
@property (nonatomic, readonly, getter = isCached)  BOOL        cached;

@end
