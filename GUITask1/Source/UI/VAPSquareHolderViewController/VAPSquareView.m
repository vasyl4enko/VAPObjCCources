//
//  VAPSquareView.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 11.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPSquareView.h"

#import "VAPMacros.h"

NSUInteger const kVAPAnimatedDuration = 2;
NSUInteger const kVAPDelay = 0;

@interface VAPSquareView ()

- (CGRect)frameWithPosition:(VAPSquarePosition)position;

- (VAPSquarePosition)nextPosition;
- (void)animateSquareView;

@end

@implementation VAPSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(VAPSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(VAPSquarePosition)squarePosition animated:(BOOL)isAnimated {
    [self setSquarePosition:squarePosition animated:isAnimated completionHandler:NULL];
}



- (void)setSquarePosition:(VAPSquarePosition)squarePosition
                 animated:(BOOL)isAnimated
        completionHandler:(void (^)())completion
{
    NSUInteger animationDuration = isAnimated ? kVAPAnimatedDuration : 0;
    
    [UIView animateWithDuration:animationDuration
                          delay:kVAPDelay
                        options:UIViewAnimationOptionCurveLinear animations:^{
                            self.squareView.frame = [self frameWithPosition:squarePosition];
                        }
                     completion:^(BOOL finished) {
                         _squarePosition = squarePosition;
                         self.animating = NO;
                         if (completion) {
                             completion();
                         }
                     }];
}

- (void)setMoving:(BOOL)moving {
    if (_moving != moving) {
        _moving = moving;
        
        [self animateSquareView];
    }
}

#pragma mark -
#pragma mark Private Implementation

- (VAPSquarePosition)nextPosition {
    return (self.squarePosition + 1) % VAPSquarePositionCount;
}

- (void)animateSquareView {
    VAPSquarePosition squarePosition = [self nextPosition];
    if (self.isMoving && !self.isAnimating) {
        self.animating = YES;
        VAPWeakify(self);
        [self setSquarePosition:squarePosition animated:YES completionHandler:^{
            VAPStrongify(weakSelf);
            [strongSelf animateSquareView];
        }];
    }
}

- (CGRect)frameWithPosition:(VAPSquarePosition)position {
    CGRect superBounds = self.bounds;
    CGRect squareFrame = self.squareView.frame;
    CGFloat pointX = CGRectGetMinX(superBounds);
    CGFloat pointY = CGRectGetMinY(superBounds);
    CGFloat deltaX = CGRectGetWidth(superBounds) - CGRectGetWidth(squareFrame);
    CGFloat deltaY = CGRectGetHeight(superBounds) - CGRectGetHeight(squareFrame);
    
    switch (position) {
        case VAPSquarePositionBottomLeft:
            pointY = deltaY;
            break;
            
        case VAPSquarePositionBottomRight:
            pointX = deltaX;
            pointY = deltaY;
            break;
            
        case VAPSquarePositionTopRight:
            pointX = deltaX;
            break;
            
        default:
            break;
    }
    
    return CGRectMake(pointX, pointY, CGRectGetWidth(squareFrame), CGRectGetHeight(squareFrame));
}

@end
