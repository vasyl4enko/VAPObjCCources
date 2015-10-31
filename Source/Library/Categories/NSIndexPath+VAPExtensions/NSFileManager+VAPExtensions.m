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
    NSFileManager *manager = [self defaultManager];
    NSArray *paths = [manager URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask];
    
    return [[[paths firstObject] path] stringByAppendingPathComponent:name];
}

@end
