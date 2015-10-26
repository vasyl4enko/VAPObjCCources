//
//  VAPImageModel.m
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPImageModel.h"

#import "VAPCache.h"
#import "VAPFileImageModel.h"
#import "VAPURLImageModel.h"

@interface VAPImageModel ()
@property (nonatomic, strong)   NSURL       *imageURL;
@property (nonatomic, strong)   UIImage     *image;

+ (instancetype)imageModelWithUrl:(NSURL *)url;

@end

@implementation VAPImageModel

#pragma mark -
#pragma mark Class Methods

+ (VAPCache *)sharedCache {
    return [VAPCache sharedChache];
}

+ (instancetype)imageModelWithUrl:(NSURL *)url {
    Class class = url.fileURL ? [VAPFileImageModel class] : [VAPURLImageModel class];
    
    return [[class alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    
    VAPCache *cache =[[self class] sharedCache];
    if([cache containsObjecWithKey:url]) {
        return [cache objectForKey:url];
    }
    
    self = [super init];
    if (self) {
        self.imageURL = url;
        [cache addObject:self withKey:url];
    }

    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)cancel {
    
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image,id error))completion {
    
}

- (void)notifyLoadingWithImage:(UIImage *)image error:(id)error {
    self.state = image ? VAPLoadingStatesDidLoad : VAPLoadingStatesDidFail;
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

@end
