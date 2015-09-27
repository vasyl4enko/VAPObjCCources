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
#import "NSIndexPath+VAPExtensions.h"

#import "VAPRandomStringView.h"
#import "VAPRandomStringCell.h"
#import "VAPData.h"
#import "UITableView+VAPExtensions.h"

#import "VAPChangesModel.h"


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
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self.randomStringView.tableView reloadData];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Private Methods

- (void)addItem:(id)sender {
    VAPDataArray *dataArray  = self.dataArray;
//    NSIndexPath *localIndexPath = [NSIndexPath indexPathForRow:[dataArray count] - 1 inSection:0];
    VAPData *data = [VAPData new];
    UITableView *tableView = self.randomStringView.tableView;
    VAPRandomStringCell *cell = [tableView dequeueCellWithClass:[VAPRandomStringCell class]];

    [self.dataArray insertObject:data atIndex:[dataArray count] - 1];
    cell.slowpokeData = self.dataArray[[dataArray count] - 1];
//    [tableView insertRowsAtIndexPaths:@[localIndexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.randomStringView.tableView setEditing:editing animated:YES];
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
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dataArray removeObjectAtIndex:indexPath.row];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.dataArray moveObjectFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

#pragma mark -
#pragma mark

- (void)dataArrayDidChanged:(VAPDataArray *)dataArray modelChanges:(id)model {
    VAPChangesModel *object = (VAPChangesModel *)model;
    if (object.arrayState == VAPArrayStatesDelete) {
        [self.randomStringView.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:object.fromIndex.row]]
                                               withRowAnimation:UITableViewRowAnimationFade];
    } else if(object.arrayState == VAPArrayStatesInsert) {
        NSUInteger count = [self.dataArray count] - 2;
        [self.randomStringView.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:count]]
                                               withRowAnimation:UITableViewRowAnimationFade];
    } else {
        [self.randomStringView.tableView moveRowAtIndexPath:object.fromIndex toIndexPath:object.toIndex];
    }
}

@end
