//
//  VAPSquareView.h
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 11.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, VAPSquarePosition) {
    VAPSquarePositionTopLeft,
    VAPSquarePositionBottomLeft,
    VAPSquarePositionBottomRight,
    VAPSquarePositionTopRight,
    VAPSquarePositionCount
};

@interface VAPSquareView : UIView
@property (nonatomic, strong) IBOutlet                  UIView              *squareView;
@property (nonatomic, strong) IBOutlet                  UIButton            *animateButton;
@property (nonatomic, assign, getter = isMoving)        BOOL                moving;
@property (nonatomic, assign)                           VAPSquarePosition   squarePosition;

- (void)setSquarePosition:(VAPSquarePosition)squarePosition animated:(BOOL)isAnimated;
- (void)setSquarePosition:(VAPSquarePosition)squarePosition
                 animated:(BOOL)isAnimated
        completionHandler:(void (^)())completion;

@end
