//
//  VAPLoginContext.m
//  
//
//  Created by Aleksandr Vasylchenko on 31.10.15.
//
//

#import "VAPLoginContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "VAPUser.h"
#import "VAPUserContext.h"

static NSString * const kVAPName =  @"name";
static NSString * const kVAPID =    @"id";

@interface VAPLoginContext ()
@property (nonatomic, strong)   VAPUser         *user;
@property (nonatomic, strong)   VAPUserContext  *userContext;

@end

@implementation VAPLoginContext

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

- (void)setUserContext:(VAPUserContext *)userContext {
    if (_userContext != userContext) {
        [_userContext cancel];
        _userContext = userContext;
        [_userContext execute];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    [loginManager logInWithReadPermissions:@[@"public_profile", @"email"] fromViewController:nil handler:^(FBSDKLoginManagerLoginResult *result, NSError *error){
        if (error) {
            self.user.state = VAPLoadingStatesDidFail;
        } else {
            FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
            self.user.ID = token.userID;
            self.userContext = [[VAPUserContext new] initWithUser:self.user];
        }
    }];
}

- (void)cancel {
    
}

@end
