//
//  VAPLoadingView.m
//  
//
//  Created by Aleksandr Vasylchenko on 07.10.15.
//
//

#import "VAPLoadingView.h"

#import "UINib+VAPExtensions.h"

static NSUInteger const kVAPAnimatedDuration = 3;
static NSUInteger const kVAPDelay = 0;

@implementation VAPLoadingView

+ (id)loadingView:(UIView *)superView {
    UIView *view =nil;
    view = [UINib objectWithClass:[VAPLoadingView class]];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow]; // replace this shit to parrent view or don't cover navi-bar
    [window addSubview:view];
    view.frame = window.bounds;
    
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
