//
//  VAPRandomStringViewController.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 19.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRandomStringViewController.h"

#import "NSString+VAPRandomString.h"
#import "VAPMacros.h"

#import "VAPRandomStringView.h"
#import "VAPRandomStringCell.h"
#import "VAPData.h"

static const NSUInteger kVAPCountRows = 30;

VAPViewControllerMainViewProperty(VAPRandomStringViewController, randomStringView, VAPRandomStringView);

@implementation VAPRandomStringViewController

#pragma mark -
#pragma mark Accessors

- (VAPRandomStringView *)randomStringView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[VAPRandomStringView class]]) {
        return (VAPRandomStringView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // в модели
    self.dataArray = [VAPDataArray new];
    for (NSUInteger index = 0; index < kVAPCountRows; index++) {
        [self.dataArray addDataObject:[VAPData new]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kVAPCountRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = @"VAPRandomStringCell";
    VAPRandomStringCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    VAPDataArray *dataArray = self.dataArray;
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:string bundle:nil];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObject];
    }
    cell.sloupokLabel.text = [[dataArray objectAtIndex:indexPath.row] name];
    cell.sloupokImage.image = [dataArray[indexPath.row] image];

    return cell;
}

@end
