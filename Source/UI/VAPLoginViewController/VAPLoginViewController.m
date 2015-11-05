//
//  VAPLoginViewController.m
//  
//
//  Created by Aleksandr Vasylchenko on 31.10.15.
//
//

#import "VAPLoginViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "VAPLoginView.h"
#import "VAPLoginContext.h"
#import "VAPUser.h"

#import "VAPMacros.h"


@interface VAPLoginViewController ()
@property (nonatomic, strong) VAPLoginContext   *loginContext;
@property (nonatomic, strong) VAPUser           *user;

@end

VAPViewControllerMainViewProperty(VAPLoginViewController, loginView, VAPLoginView);

@implementation VAPLoginViewController

#pragma mark -
#pragma mark LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [VAPUser new];
    self.loginView.user = self.user;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Accessors

- (void)setLoginContext:(VAPLoginContext *)loginContext {
    if (_loginContext != loginContext) {
        [_loginContext cancel];
        _loginContext = loginContext;
        [_loginContext execute];
    }
}

#pragma mark -
#pragma mark Private Methods

- (IBAction)loginButton:(id)sender {
    VAPUser *user = self.loginView.user;
    if (user.ID) {
        [[FBSDKLoginManager new] logOut];
        user.ID = nil;
    } else {
        self.loginContext = [[VAPLoginContext alloc] initWithUser:user];
    }
}

@end
