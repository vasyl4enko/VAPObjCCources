//
//  VAPLoginView.h
//  
//
//  Created by Aleksandr Vasylchenko on 31.10.15.
//
//

#import "VAPView.h"

#import "VAPImageView.h"

@class VAPUser;

@interface VAPLoginView : VAPView
@property (nonatomic, strong)   IBOutlet    UIButton       *loginButton;
@property (nonatomic, strong)   IBOutlet    VAPImageView   *contentImageView;
@property (nonatomic, strong)   IBOutlet    UILabel        *fullNameLabel;
@property (nonatomic, strong)               VAPUser        *user;

- (void)fillWithContent:(VAPUser *)user;

@end
