//
//  VAPSquareViewController.m
//  GUITask1
//
//  Created by Aleksandr Vasylchenko on 08.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPSquareViewController.h"
#import "VAPSquareView.h"

@interface VAPSquareViewController ()
@property (nonatomic, readonly)     VAPSquareView    *rectangleView;

@end

@implementation VAPSquareViewController

@dynamic rectangleView;

- (VAPSquareView *)rectangleView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[VAPSquareView class]]) {
        return (VAPSquareView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
