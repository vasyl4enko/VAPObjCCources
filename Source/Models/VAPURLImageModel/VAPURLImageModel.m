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

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self cancel];
}

#pragma mark -
#pragma mark Accessors 

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
        [super performLoadingWithCompletion:completion];
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
        [super performLoadingWithCompletion:completion];
    };
    
    self.downloadTask = [self.urlSession downloadTaskWithURL:self.imageURL completionHandler:block];
}

@end
