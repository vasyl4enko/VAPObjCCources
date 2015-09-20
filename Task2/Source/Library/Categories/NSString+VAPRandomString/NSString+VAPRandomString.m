//
//  NSString+VAPRandomString.m
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 26.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import "NSString+VAPRandomString.h"


NSUInteger const kVAPDefualtLength = 10;


@implementation NSString (VAPRandomString)


+ (id)randomString {
    NSString *result = [self randomStringWithLength:kVAPDefualtLength];
    
    return [self stringWithString:result];
}

+ (id)randomStringWithLength:(NSUInteger)length {
    NSString *latinNumericAlphabet = [self latinNumericAlphabet];
    NSString *result = [self randomStringWithLength:length alphabet:latinNumericAlphabet];
    
    return [self stringWithString:result];
}

+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSUInteger lengthAlphabet = alphabet.length;
    NSMutableString *randomString = [NSMutableString string];
    
    for (NSUInteger index = 0; index < length; index++) {
        unichar charecter = [alphabet characterAtIndex:arc4random_uniform((uint32_t)lengthAlphabet)];
        [randomString appendFormat:@"%C",charecter];
    }
    
    return [[self stringWithString:randomString] copy];
}

+ (id)uppercaseLatinAlphabet {
    NSRange range = NSMakeRange('A', 'Z' - 'A' + 1);
    
    return [self alphabetWithRange:range];
}

+ (id)lowercaseLatinAlphabet {
    NSRange range = NSMakeRange('a', 'z' - 'a' + 1);
    
    return [self alphabetWithRange:range];
}

+ (id)numericAlphabet {
    NSRange range = NSMakeRange('0', '9' - '0' + 1);
    
    return [self alphabetWithRange:range];
}

+ (id)latinNumericAlphabet {
    NSMutableString *result = [NSMutableString string];
    [result appendString:[self uppercaseLatinAlphabet]];
    [result appendString:[self lowercaseLatinAlphabet]];
    [result appendString:[self numericAlphabet]];
    
    return [self stringWithString:result];
}

+ (id)alphabetWithRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string] ;
    for (uint i = 0; i < range.length ; i++ ) {
        unichar character = range.location + i;
        [result appendFormat:@"%C", character];
    }
    
    return [self stringWithString:result];
}


@end
