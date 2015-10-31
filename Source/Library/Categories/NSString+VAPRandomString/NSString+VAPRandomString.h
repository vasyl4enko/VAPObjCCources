//
//  NSString+VAPRandomString.h
//  VAPObjCCources
//
//  Created by Aleksandr Vasylchenko on 26.07.15.
//  Copyright (c) 2015 Aleksandr Vasylchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (VAPRandomString)

+ (id)randomString;

+ (id)randomStringWithLength:(NSUInteger)length;
+ (id)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
