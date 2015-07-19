//
//  VAPEnterprise.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 15.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#warning depracated

@class VAPOfficeBuilding;

@interface VAPEnterprise : NSObject
@property (nonatomic, copy) VAPOfficeBuilding *headOffice;
@property (nonatomic, retain, readonly) NSDictionary *departments;

//- (id)doIt:(id)

@end
