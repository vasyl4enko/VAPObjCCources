//
//  NSString+VAPRandomString.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 26.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "NSString+VAPRandomString.h"


NSUInteger const kDefualtRange = 15;

@implementation NSString (VAPRandomString)


+ (NSString *)randomString {
    NSMutableString *result = [[[NSMutableString alloc] init] autorelease];
    NSArray *alphabet = [NSString latinAlphabet];
    u_int32_t alphabetCount = (u_int32_t) [alphabet count];
    
    for (uint index = 0 ; index < kDefualtRange ; index++) {
        NSUInteger charIndex = arc4random_uniform(alphabetCount);
        NSString *str = [alphabet objectAtIndex:charIndex];
        [result appendString:[alphabet objectAtIndex:charIndex]];
        
        
    }
    
    return [result copy];
}

+ (NSArray *)uppercaseLatinAlphabet {
    NSRange range = NSMakeRange('A', 'Z' - 'A' + 1);
    
    return [self alphabetWithRange:range];
}
+ (NSArray *)lowercaseLatinAlphabet {
    NSRange range = NSMakeRange('a', 'z' - 'a' + 1);
    
    return [self alphabetWithRange:range];
}
+ (NSArray *)numericAlphabet {
    NSRange range = NSMakeRange('0', '9' - '0' + 1);
    
    return [self alphabetWithRange:range];
}

+ (NSArray *)latinAlphabet {
    NSMutableArray *result = [NSMutableArray array];
    [result addObjectsFromArray:[self uppercaseLatinAlphabet]];
    [result addObjectsFromArray:[self lowercaseLatinAlphabet]];
    [result addObjectsFromArray:[self numericAlphabet]];
    
    return [[result copy] autorelease];
}

+ (NSArray *)alphabetWithRange:(NSRange)range {
    [self release];
    
    NSMutableArray *result = [NSMutableArray array] ;
    for (uint i = 0; i < range.length ; i++ ) {
        unichar character = range.location + i;
        [result addObject:[NSString stringWithFormat:@"%C", character]];
    }
    
    return [[result copy] autorelease];
}


@end
