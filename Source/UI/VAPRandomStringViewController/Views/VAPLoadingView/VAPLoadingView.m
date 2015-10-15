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
    UIView *view =[UINib objectWithClass:[VAPLoadingView class]];
    [superView addSubview:view];
    view.frame = superView.bounds;
    
    return view;
}

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible withAnimated:NO];
}

- (void)setVisible:(BOOL)visible withAnimated:(BOOL)animated {
    [self setVisible:visible withAnimated:animated completion:nil];
}

- (void)setVisible:(BOOL)visible withAnimated:(BOOL)animated completion:(void (^)())completion {
    NSUInteger animationDuration = animated ? kVAPAnimatedDuration : 0;
    [UIView animateWithDuration:animationDuration
                          delay:kVAPDelay
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         self.visible = NO;
                         if (completion) {
                             completion();
                         }
                     }];
}

@end
