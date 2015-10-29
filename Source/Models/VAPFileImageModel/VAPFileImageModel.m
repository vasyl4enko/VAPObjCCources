//
//  VAPFileImageModel.m
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPFileImageModel.h"

static NSString * const kVAPKKK = @"WhitePower";

@interface VAPFileImageModel ()

- (void)removeFromCache;

@end

@implementation VAPFileImageModel

@dynamic fileFolder;
@dynamic fileName;
@dynamic filePath;
@dynamic cached;

- (NSString *)fileFolder {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)fileName {
    NSString *path = self.imageURL.absoluteString;
    NSCharacterSet *charactersSet = [NSCharacterSet characterSetWithCharactersInString:@"/."];

    return [[path componentsSeparatedByCharactersInSet:charactersSet] componentsJoinedByString:kVAPKKK];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingString:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {
    UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
    if (nil == image) {
        [self removeFromCache];
    }
    
    if(completion) {
        completion(image, nil);
    }
}

- (void)removeFromCache {
    if (self.cached) {
        return;
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    [fileManager removeItemAtPath:self.filePath error:&error];
}

@end
