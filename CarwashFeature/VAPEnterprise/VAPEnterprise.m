//
//  VAPEnterprise.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPEnterprise.h"

@interface VAPEnterprise ()
@property (nonatomic, retain) NSMutableDictionary *mutableDepartments;

@end

@implementation VAPEnterprise
@dynamic departments;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.headOffice = nil;
    self.mutableDepartments = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Accessors

- (NSMutableDictionary *)departments {
    return [[self.mutableDepartments copy] autorelease];
}

#pragma mark -
#pragma mark Public Implementation

- (void)addDepartment:(id) object {
    if (nil != object) {
        NSString *key = [NSString stringWithFormat:@"%@",[object class]];
        if (nil != [self.mutableDepartments objectForKey:key]) {
            NSArray *array = [self.mutableDepartments objectForKey:key];
            
            
            
        }
    }
}

@end
