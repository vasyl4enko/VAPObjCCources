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
    unichar zero = '0';
    unichar zed = 'z';
    zed -= zero + 1;
    NSRange  defaultRange = NSMakeRange(zero, zed);
    
    
    return [self randomStringWithUnicodeRange:defaultRange];
}

+ (NSString *)randomStringWithUnicodeRange:(NSRange)range {
    NSMutableString *string = [NSMutableString string];
    for (uint64_t index = 0; index < kDefualtRange; index++) {
        unichar character = range.location + arc4random_uniform((uint32_t)range.length);
        [string appendFormat:@"%C", character];
    }
    
    return string;
}

//+ (NSArray *)uppercaseLatinAlphabet {
//    NSRange range = NSMakeRange('A', 'Z' - 'A' + 1);
//    
//    return [self alphabetWithRange:range];
//}
//+ (NSArray *)lowercaseLatinAlphabet {
//    NSRange range = NSMakeRange('a', 'z' - 'a' + 1);
//    
//    return [self alphabetWithRange:range];
//}
//+ (NSArray *)numericAlphabet {
//    NSRange range = NSMakeRange('0', '9' - '0' + 1);
//    
//    return [self alphabetWithRange:range];
//}
//
//+ (NSArray *)latinAlphabet {
//    NSMutableArray *result = [NSMutableArray array];
//    [result addObjectsFromArray:[self uppercaseLatinAlphabet]];
//    [result addObjectsFromArray:[self lowercaseLatinAlphabet]];
//    [result addObjectsFromArray:[self numericAlphabet]];
//    
//    return [[result copy] autorelease];
//}
//
//+ (NSArray *)alphabetWithRange:(NSRange)range {
//    [self release];
//    
//    NSMutableArray *result = [NSMutableArray array] ;
//    for (uint i = 0; i < range.length ; i++ ) {
//        unichar character = range.location + i;
//        [result addObject:[NSString stringWithFormat:@"%C", character]];
//    }
//    
//    return [[result copy] autorelease];
//}


@end
