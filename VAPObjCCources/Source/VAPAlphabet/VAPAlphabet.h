//
//  VAPAlphabet.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 29.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VAPAlphabet : NSObject
+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithString:(NSString *)string;
+ (instancetype)alphabetWithStrings:(NSArray *)array;

+ (instancetype)numericAlphabet; // use VAPAlphabetWithRange
+ (instancetype)lowercaseLatinAlphabet;
+ (instancetype)uppercaseLatinAlphabet;

@end
