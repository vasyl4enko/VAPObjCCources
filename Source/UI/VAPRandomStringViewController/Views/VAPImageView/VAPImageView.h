//
//  VAPImageView.h
//  
//
//  Created by Aleksandr Vasylchenko on 28.10.15.
//
//

#import "VAPView.h"

#import "VAPModelObserver.h"

@class VAPModel;
@class VAPImageModel;

@interface VAPImageView : VAPView <VAPModelObserver>
@property (nonatomic, strong)   IBOutlet        UIImageView     *imageView;
@property (nonatomic, strong)   VAPImageModel                   *imageModel;

- (void)fillWithContent:(VAPImageModel *)content;

@end
