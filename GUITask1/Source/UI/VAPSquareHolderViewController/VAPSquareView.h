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
@property (nonatomic, strong) IBOutlet              UIView              *square;
@property (nonatomic, strong) IBOutlet              UIButton            *action;
@property (nonatomic, assign, getter = isMove)      BOOL                move;
@property (nonatomic, unsafe_unretained)            VAPSquarePosition   squarePosition;

- (void)setSquarePosition:(VAPSquarePosition)squarePosition animated:(BOOL)isAnimated;
- (void)setSquarePosition:(VAPSquarePosition)squarePosition
                 animated:(BOOL)isAnimated
        completionHandler:(void (^)())completion;

- (void)moveToNextPosition;

@end
