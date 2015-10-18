//
//  VAPRandomStringViewController.m
//  Task2
//
//  Created by Aleksandr Vasylchenko on 19.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPRandomStringViewController.h"

#import "VAPRandomStringView.h"
#import "VAPDataCell.h"
#import "VAPData.h"
#import "VAPChangesModel.h"

#import "NSString+VAPRandomString.h"
#import "NSIndexPath+VAPExtensions.h"
#import "UITableView+VAPExtensions.h"

#import "VAPMacros.h"

VAPViewControllerMainViewProperty(VAPRandomStringViewController, randomStringView, VAPRandomStringView);

@implementation VAPRandomStringViewController

#pragma mark -
#pragma mark Initializations and Deallocatons

- (void)dealloc {
    self.dataArray = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        [self setupNavigationItem];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setDataArray:(VAPDataArray *)dataArray {
    VAPSynthesizeObservingSetter(dataArray);
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataArray loadModel];
//    [self.randomStringView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Private Methods

- (void)addItem:(id)sender {
    VAPDataArray *dataArray  = self.dataArray;
    NSUInteger index = dataArray.count != 0 ? dataArray.count - 1 : 0;
    [dataArray insertObject:[VAPData new] atIndex:index];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.randomStringView.tableView setEditing:editing animated:YES];
}

- (void)setupNavigationItem {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addItem:)];
    UINavigationItem *navigationItem = self.navigationItem;
    navigationItem.rightBarButtonItem = addButton;
    navigationItem.leftBarButtonItem = self.editButtonItem;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VAPDataCell *cell = [tableView dequeueCellWithClass:[VAPDataCell class]];
    cell.content = self.dataArray[indexPath.row];
    
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
#pragma mark VAPModelObserver

- (void)modelDidLoad:(id)object {
    NSLog(@"string");
    
    [self.randomStringView.tableView reloadData];
}

#pragma mark -
#pragma mark VAPArrayObserver

- (void)dataArray:(VAPArray *)object didChangeWithChangesModel:(VAPChangesModel *)model{
    [self.randomStringView.tableView updateWithChangesModel:model];
}

@end
