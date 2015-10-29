//
//  VAPLoadingView.h
//  
//
//  Created by Aleksandr Vasylchenko on 07.10.15.
//
//

#import <UIKit/UIKit.h>

@interface VAPLoadingView : UIView
@property (nonatomic, readonly, getter = isVisible)     BOOL    visible;

+ (id)loadingView:(UIView *)superView;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)())completion;

@end
