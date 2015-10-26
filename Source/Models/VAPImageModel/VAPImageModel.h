//
//  VAPImageModel.h
//  
//
//  Created by Aleksandr Vasylchenko on 25.10.15.
//
//

#import "VAPModel.h"

@class VAPCache;

@interface VAPImageModel : VAPModel
@property (nonatomic, readonly)     NSURL       *imageURL;
@property (nonatomic, readonly)     UIImage     *image;

+ (VAPCache *)sharedCache;

- (instancetype)initWithURL:(NSURL *)url;

- (void)cancel;

- (void)performLoadingWithCompletion:(void(^)(UIImage *image,id error))completion;
- (void)notifyLoadingWithImage:(UIImage *)image error:(id)error;
- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error;

@end
