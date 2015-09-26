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

#import "VAPModelChanges.h"
#import "VAPRandomStringView.h"
#import "VAPRandomStringCell.h"
#import "VAPData.h"
#import "UITableView+VAPExtensions.h"
VAPViewControllerMainViewProperty(VAPRandomStringViewController, randomStringView, VAPRandomStringView);

@implementation VAPRandomStringViewController

#pragma mark -
#pragma mark Initializations and Deallocatons

- (void)dealloc
{
    self.dataArray = nil;
}

#pragma mark -
#pragma mark Accessors

- (VAPRandomStringView *)randomStringView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[VAPRandomStringView class]]) {
        return (VAPRandomStringView *)self.view;
    }
    
    return nil;
}

- (void)setDataArray:(VAPDataArray *)dataArray {
    if ([_dataArray containsObserver:self]) {
        [_dataArray removeObserver:self];
    }
    
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        [_dataArray addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self action:@selector(addItem:)];
    
    [self.navigationItem setRightBarButtonItem:addButton];
    [self.randomStringView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Private Methods

- (void)addItem:(id)sender {
    VAPDataArray *dataArray  = self.dataArray;
    NSIndexPath *localIndexPath = [NSIndexPath indexPathForRow:dataArray.count inSection:0];
    VAPData *data = [VAPData new];
    [self.dataArray insertObject:data atIndex:dataArray.count - 1];
    //need cell[dataArray.count - 1]
    [self.randomStringView.tableView insertRowsAtIndexPaths:@[localIndexPath]
                                           withRowAnimation:UITableViewRowAnimationFade];
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VAPRandomStringCell *cell = [tableView dequeueCellWithClass:[VAPRandomStringCell class]];
    cell.slowpokeData = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deleteRowAtIndexPath:editingStyle];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
        [NSIndexPath indexPathWithIndex:1];
//        [self.randomStringView.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:0]]
//                                               withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

#pragma mark -
#pragma mark

- (void)deleteRowAtIndexPath:(UITableViewCellEditingStyle)editingStyle  {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        self.styleDelete = UITableViewCellEditingStyleDelete;
    }
}

- (void)dataArrayChanged:(VAPDataArray *)dataArray modelChanges:(id)model {
//    self.randomStringView.tableView.
    if (self.styleDelete) {
        VAPModelChanges *object = (VAPModelChanges *)model;
        [self.randomStringView.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:object.fromVar inSection:0]]
                                               withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
