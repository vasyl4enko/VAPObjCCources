//
//  NSFileManager+VAPExtensions.m
//  
//
//  Created by Aleksandr Vasylchenko on 06.10.15.
//
//

#import "NSFileManager+VAPExtensions.h"

@implementation NSFileManager (VAPExtensions)

+ (NSString *)pathWithFileName:(NSString *)name {
    return [self pathWithFileName:name libraryDirectory:NSLibraryDirectory];
}

+ (NSString *)pathWithFileName:(NSString *)name libraryDirectory:(NSSearchPathDirectory)directory {
    return [self pathWithFileName:name libraryDirectory:directory inDomains:NSUserDomainMask];
}

+ (NSString *)pathWithFileName:(NSString *)name
              libraryDirectory:(NSSearchPathDirectory)directory
                     inDomains:(NSSearchPathDomainMask)domainMask
{
    NSFileManager *manager = [self defaultManager];
    NSArray *paths = [manager URLsForDirectory:directory inDomains:domainMask];
    
    return [[[paths firstObject] path] stringByAppendingPathComponent:name];
}

@end
