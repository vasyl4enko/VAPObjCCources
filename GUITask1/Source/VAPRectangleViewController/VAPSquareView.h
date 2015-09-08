//
//  VAPSquareView.h
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 08.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, VAPSquarePosition) {
    VAPSquarePositionTopLeft,
    VAPSquarePositionTopRight,
    VAPSquarePositionBottomLeft,
    VAPSquarePositionBottomRight
};

@interface VAPSquareView : UIView
@property (nonatomic, retain) IBOutlet UIView *rectangle;
@property (nonatomic, assign) VAPSquarePosition squarePosition;

@end
