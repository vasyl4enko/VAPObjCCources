//
//  VAPFileImageModel.m
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPFileImageModel.h"

@interface VAPFileImageModel ()

@end

@implementation VAPFileImageModel

@dynamic filePath;

- (NSString *)filePath {
    return self.imageURL.path;
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {
    UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
    if(completion) {
        completion(image, nil);
    }
}

@end
