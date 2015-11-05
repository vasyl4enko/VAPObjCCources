//
//  VAPUser.m
//  
//
//  Created by Aleksandr Vasylchenko on 01.11.15.
//
//

#import "VAPUser.h"

#import "VAPImageModel.h"

@implementation VAPUser

@dynamic imageModel;

#pragma mark -
#pragma mark Accessors

- (VAPImageModel *)imageModel {
    return [VAPImageModel imageModelWithUrl:[NSURL URLWithString:self.imageURL]];
}

@end
