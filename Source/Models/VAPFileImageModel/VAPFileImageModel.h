//
//  VAPFileImageModel.h
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPImageModel.h"

@interface VAPFileImageModel : VAPImageModel
@property (nonatomic, readonly)                     NSString    *fileFolder;
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly)                     NSString    *fileName;
@property (nonatomic, readonly, getter = isCached)  BOOL        cached;

@end
