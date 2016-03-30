//
//  LoginViewController.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController
- (void)viewDidLoad {
  [super viewDidLoad];
  
  Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
  
  self.loginViewController = [[FirebaseLoginViewController alloc] initWithRef:firebaseRef];
  [self.loginViewController enableProvider:FAuthProviderFacebook];
  [self.loginViewController enableProvider:FAuthProviderGoogle];
  [self.loginViewController enableProvider:FAuthProviderTwitter];
  [self.loginViewController enableProvider:FAuthProviderPassword];
  // Scenario 1: Set up captive portal login flow
  [self.loginViewController didDismissWithBlock:^(FAuthData *user, NSError *error) {
    if (user) {
      // Handle user case
    } else if (error) {
      // Handle error case
    } else {
      // Handle cancel case
    }
  }];
  
  // Scenario 2: Set up user action based login flow
  [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
  [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
}

// Scenario 1: Application launches login flow, handles dismissal and routing in `didDismissWithBlock:`
- (void)viewDidAppear:(BOOL)animated {
  if (![self.loginViewController currentUser]) {
    [self presentViewController:self.loginViewController animated:YES completion:nil];
  }
}

// Scenario 2: User action launches login flow, dismissal and routing handled by `FirebaseLoginViewController`
- (void)login {
  if (![self.loginViewController currentUser]) {
    [self presentViewController:self.loginViewController animated:YES completion:nil];
  }
}

- (void)logout {
  if ([self.loginViewController currentUser]) {
    [self.loginViewController logout];
  }
}
@end
