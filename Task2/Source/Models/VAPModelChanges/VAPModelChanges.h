//
//  VAPModelChanges.h
//  Task2
//
//  Created by Aleksandr Vasylchenko on 23.09.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPModelChanges : NSObject
@property (nonatomic, assign)     NSUInteger    fromVar;
@property (nonatomic, assign)     NSUInteger    toVar;

+ (id)setupModelWithFromVar:(NSUInteger)fromVar toVar:(NSUInteger)toVar;

@end
