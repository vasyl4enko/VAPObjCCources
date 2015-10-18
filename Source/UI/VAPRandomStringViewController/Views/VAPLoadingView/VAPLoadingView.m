//
//  VAPLoadingView.m
//  
//
//  Created by Aleksandr Vasylchenko on 07.10.15.
//
//

#import "VAPLoadingView.h"

#import "UINib+VAPExtensions.h"

static NSTimeInterval const kVAPAnimatedDuration    = 3;
static NSTimeInterval const kVAPDelay               = 0;

@implementation VAPLoadingView

+ (id)loadingView:(UIView *)superView {
    UIView *view =[UINib objectWithClass:self];
    [superView addSubview:view];
    view.frame = superView.bounds;
    
    return view;
}

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:NO];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated completion:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated completion:(void (^)())completion {
    NSUInteger animationDuration = animated ? kVAPAnimatedDuration : 0;
    [UIView animateWithDuration:animationDuration
                          delay:kVAPDelay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{self.alpha = visible ? 1.0 : 0.0;}
                     completion:^(BOOL finished) {
                         _visible = NO;
                         if (completion) {
                             completion();
                         }
                     }];
}

@end
