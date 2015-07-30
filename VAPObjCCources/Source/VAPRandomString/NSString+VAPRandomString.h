//
//  NSString+VAPRandomString.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 26.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//


/*Задание 4.
Написать расширения для строки, которая бы генерировалась случайным образом.
ТРебования:
1. должна быть расширяемой
2. должна быть удобной
3. должна предоставлять возможность работать с разными наборами символов */


#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSUInteger const kDefualtRange;

@interface NSString (VAPRandomString)

+ (NSString *)randomString;

+ (NSString *)randomStringWithUnicodeRange:(NSRange)range;

@end
