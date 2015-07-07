//
//  VAPWoman.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 07.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "VAPWoman.h"

@implementation VAPWoman

//- (void)dealloc {
//    
//    [super dealloc];
//}

- (id)performGenderSpecificOperation {
    NSLog(@"Мой ребенок пошел на органы");
//    return [[self birthChild] autorelease];
    return [self birthChild];
}

@end
