//
//  VAPSquareView.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 11.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPSquareView.h"

NSUInteger const kVAPAnimatedDurtion = 2;
NSUInteger const kVAPDelay = 0;

@interface VAPSquareView ()
@property (nonatomic, assign, getter = isViewMove) BOOL viewMove;

- (CGRect)frameWithPosition:(VAPSquarePosition)position;

@end

@implementation VAPSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(VAPSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

#pragma mark -
#pragma mark Public Methods

- (void)setSquarePosition:(VAPSquarePosition)squarePosition animated:(BOOL)isAnimated {
    [self setSquarePosition:squarePosition animated:isAnimated completionHandler:NULL];
}

- (void)setSquarePosition:(VAPSquarePosition)squarePosition
                 animated:(BOOL)isAnimated
        completionHandler:(void (^)())completion {
    NSUInteger animationDuration = kVAPAnimatedDurtion * isAnimated;
    [UIView animateWithDuration:animationDuration
                          delay:kVAPDelay
                        options:UIViewAnimationOptionCurveLinear animations:
     ^{
        self.square.frame = [self frameWithPosition:squarePosition];;
     } completion:^(BOOL finished) {
        if (completion) {
            completion();
        } 
    }];
}


- (void)nextPosition{
    VAPSquarePosition position = _squarePosition;
    position = (position + 1) % 4;
    _squarePosition = position;
    if (self.isViewMove) {
        id __weak weakSelf = self;
        [self setSquarePosition:position animated:YES completionHandler:^{
            id __strong strongSelf = weakSelf;
            [strongSelf nextPosition];
        }];
    }
}

- (IBAction)onMoveSquareView:(id)sender {
    self.viewMove = !self.isViewMove;
    if (self.isViewMove) {
        id __weak weakSelf = self;
        [self setSquarePosition:self.squarePosition animated:YES completionHandler:^{
            id __strong strongSelf = weakSelf;
            [strongSelf nextPosition];
        }];
    }
}

#pragma mark -
#pragma mark Private Implementation

- (CGRect)frameWithPosition:(VAPSquarePosition)position {
    CGRect superBounds = self.bounds;
    CGRect squareFrame = self.square.frame;
    CGFloat deltaX = superBounds.size.width - squareFrame.size.width;
    CGFloat deltaY = superBounds.size.height - squareFrame.size.height;
    CGFloat originX = superBounds.origin.x;
    CGFloat originY = superBounds.origin.y;
    CGRect result;
    
    switch (position) {
        case VAPSquarePositionBottomLeft:{
             result = CGRectMake(originX, deltaY, squareFrame.size.width, squareFrame.size.height);
        }
            break;
        case VAPSquarePositionBottomRight:{
            result = CGRectMake(deltaX, deltaY, squareFrame.size.width, squareFrame.size.height);
        }
            break;
        case VAPSquarePositionTopRight:{
            result = CGRectMake(deltaX, originY, squareFrame.size.width, squareFrame.size.height);
        }
            break;
        case VAPSquarePositionTopLeft:{
            result = CGRectMake(originX, originY, squareFrame.size.width, squareFrame.size.height);
        }
            break;
        default:
            break;
    }
    
    return result;
}




@end
