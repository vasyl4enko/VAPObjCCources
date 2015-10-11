//
//  NSFileManager+VAPExtensions.h
//  
//
//  Created by Aleksandr Vasylchenko on 06.10.15.
//
//

#import <Foundation/Foundation.h>

@interface NSFileManager (VAPExtensions)

+ (NSString *)pathWithFileName:(NSString *)name;
+ (NSString *)pathWithFileName:(NSString *)name libraryDirectory:(NSSearchPathDirectory)directory;
+ (NSString *)pathWithFileName:(NSString *)name
              libraryDirectory:(NSSearchPathDirectory)directory
                     inDomains:(NSSearchPathDomainMask)domainMask;

@end
