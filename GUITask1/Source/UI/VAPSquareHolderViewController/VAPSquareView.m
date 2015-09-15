//
//  VAPSquareView.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 11.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPSquareView.h"

NSUInteger const kVAPAnimatedDuration = 2;
NSUInteger const kVAPDelay = 0;

@interface VAPSquareView ()

- (CGRect)frameWithPosition:(VAPSquarePosition)position;

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

- (void)setSquarePosition:(VAPSquarePosition)squarePosition animated:(BOOL)isAnimated completionHandler:(void (^)())completion {
    NSUInteger animationDuration = isAnimated == 0 ? 0 : kVAPAnimatedDuration;
    [UIView animateWithDuration:animationDuration
                          delay:kVAPDelay
                        options:UIViewAnimationOptionCurveLinear animations:^{
                         self.square.frame = [self frameWithPosition:squarePosition];
                         }
                     completion:^(BOOL finished) {
                         _squarePosition = (_squarePosition + 1) % VAPSquarePositionCount;
                             if (completion) {
                                 completion();
                             }
                         }];
}

- (void)setMove:(BOOL)move {
    if (_move != move) {
        _move = move;
        [self moveToNextPosition];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)moveToNextPosition{
    if (self.isMove) {
        id __weak weakSelf = self;
        [self setSquarePosition:self.squarePosition animated:YES completionHandler:^{
            id __strong strongSelf = weakSelf;
            [strongSelf moveToNextPosition];
        }];
    }
}

#pragma mark -
#pragma mark Private Implementation

- (CGRect)frameWithPosition:(VAPSquarePosition)position {
    CGRect superBounds = self.bounds;
    CGRect squareFrame = self.square.frame;
    CGFloat pointX = superBounds.origin.x;
    CGFloat pointY = superBounds.origin.y;
    CGRect result = CGRectNull;
    
    switch (position) {
        case VAPSquarePositionBottomLeft:{
            pointY = superBounds.size.height - squareFrame.size.height;
        }
            break;
        case VAPSquarePositionBottomRight:{
            pointX = superBounds.size.width - squareFrame.size.width;;
            pointY = superBounds.size.height - squareFrame.size.height;
        }
            break;
        case VAPSquarePositionTopRight:{
            pointX = superBounds.size.width - squareFrame.size.width;;
        }
            break;

        default:
            break;
    }
    
    result = CGRectMake(pointX, pointY, squareFrame.size.width, squareFrame.size.height);

    return result;
}

@end
