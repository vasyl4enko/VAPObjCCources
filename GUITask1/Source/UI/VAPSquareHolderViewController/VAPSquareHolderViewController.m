//
//  VAPSquareHolderViewController.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 11.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPSquareHolderViewController.h"
#import "VAPSquareView.h"

@interface VAPSquareHolderViewController ()
@property (nonatomic, readonly) VAPSquareView *squareView;

@end

@implementation VAPSquareHolderViewController

@dynamic squareView;

- (VAPSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[VAPSquareView class]]) {
        return (VAPSquareView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)onMoveSquareView:(id)sender {
    self.squareView.moving = !self.squareView.isMoving;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
