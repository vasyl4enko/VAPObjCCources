//
//  VAPUserContext.m
//  
//
//  Created by Aleksandr Vasylchenko on 31.10.15.
//
//

#import "VAPUserContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "VAPUser.h"

@interface VAPUserContext ()
@property (nonatomic, strong) VAPUser *user;
@property (nonatomic, strong)   FBSDKGraphRequestConnection *connection;
@property (nonatomic, readonly) FBSDKGraphRequest           *request;

@end

@implementation VAPUserContext

@dynamic request;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUser:(VAPUser *)user {
    self = [super init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (FBSDKGraphRequest *)request {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields":@"name,email,picture{url}"}];
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    id handler = ^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (error) {
            self.user.state = VAPLoadingStatesDidFail;
            
            return;
        } else {
            self.user.name = result[@"name"];
            self.user.imageURL = result[@"picture"][@"data"][@"url"];
            self.user.state = VAPLoadingStatesDidLoad;
        }
    };
    
    self.connection = [self.request startWithCompletionHandler:handler];
}

@end
