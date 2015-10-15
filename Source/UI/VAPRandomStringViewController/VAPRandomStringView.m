//
//  VAPRandomStringView.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 19.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRandomStringView.h"

#import "VAPLoadingView.h"


@interface VAPRandomStringView ()
@property (nonatomic, readwrite)    VAPLoadingView  *loadingView;

@end

@implementation VAPRandomStringView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [VAPLoadingView loadingView:[[UIApplication sharedApplication] keyWindow]]; 
    [self.loadingView setVisible:YES withAnimated:YES];
}

#pragma mark -
#pragma mark Public Methods

- (void)show {
    [self.loadingView setVisible:YES withAnimated:YES];
}
- (void)hide {
    [self.loadingView setVisible:NO withAnimated:NO];
}
- (BOOL)isHidden {
    return self.loadingView.hidden;
}

@end
