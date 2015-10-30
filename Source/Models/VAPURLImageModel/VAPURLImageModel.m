//
//  VAPURLImageModel.m
//
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPURLImageModel.h"

@interface VAPURLImageModel ()
@property (nonatomic, strong)     NSURLSession                *urlSession;
@property (nonatomic, strong)     NSURLSessionDownloadTask    *downloadTask;

- (void)downloadImage:(void(^)(UIImage *image, id error))completion;

@end

@implementation VAPURLImageModel

@dynamic fileFolder;
@dynamic fileName;
@dynamic filePath;
@dynamic cached;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fileFolder {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)fileName {
    NSString *path = self.imageURL.absoluteString;
    NSCharacterSet *charactersSet = [NSCharacterSet characterSetWithCharactersInString:@"/."];
    
    return [[path componentsSeparatedByCharactersInSet:charactersSet] componentsJoinedByString:@"%20"];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingString:self.fileName];
}

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

- (NSURLSession *)urlSession {
    static NSURLSession *__urlSession = nil;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __urlSession = [NSURLSession sessionWithConfiguration:configuration];
    });
    
    return __urlSession;
}

#pragma mark -
#pragma mark Public Methods

- (void)cancel {
    self.downloadTask = nil;
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {
    if (self.cached) {
        [self loadImageWithFilePath:completion];
    } else {
        [self downloadImage:completion];
    }
}

#pragma mark -
#pragma mark Private Method

- (void)downloadImage:(void (^)(UIImage *, id))completion {
    id block = ^(NSURL *url, NSURLResponse *response, NSError *error) {
        [[NSFileManager defaultManager] copyItemAtURL:url
                                                toURL:[NSURL fileURLWithPath:self.filePath]
                                                error:nil];
        [self loadImageWithFilePath:completion];
    };
    
    self.downloadTask = [self.urlSession downloadTaskWithURL:self.imageURL completionHandler:block];
}

- (void)removeFromCache {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    [fileManager removeItemAtPath:self.filePath error:&error];
}

- (void)loadImageWithFilePath:(void (^)(UIImage *, id))completion {
    UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
    if (!image) {
        [self removeFromCache];
    }
    
    if(completion) {
        completion(image, nil);
    }
}

@end
