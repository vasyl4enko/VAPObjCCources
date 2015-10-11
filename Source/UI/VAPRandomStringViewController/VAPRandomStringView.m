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
@property (nonatomic, strong) VAPLoadingView *loadingView;

@end

@implementation VAPRandomStringView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.loadingView = [VAPLoadingView loadingView:self];
    [self.loadingView setVisible:YES withAnimated:YES];
}

@end
