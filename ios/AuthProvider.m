//
//  AuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AuthProvider.h"

@implementation AuthProvider

// Facebook auth method


Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
FirebaseFacebookAuthProvider *facebookProvider = [[FirebaseFacebookAuthProvider alloc] initWithRef:firebaseRef authDelegate:self];
[facebookProvider login];
// ...
[facebookProvider logout];

// Google

Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
FirebaseGoogleAuthProvider *googleProvider = [[FirebaseGoogleAuthProvider alloc] initWithRef:firebaseRef authDelegate:self uiDelegate:self];
[googleProvider login];
// ...
[googleProvider logout];

// Twitter

Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
FirebaseTwitterAuthProvider *twitterProvider = [[FirebaseTwitterAuthProvider alloc] initWithRef:firebaseRef authDelegate:self twitterDelegate:self];
[twitterProvider login];
// ...
[twitterProvider logout];

// Password

Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
FirebasePasswordAuthProvider *passwordProvider = [[FirebasePasswordAuthProvider alloc] initWithRef:firebaseRef authDelegate:self];
[passwordProvider loginWithEmail:@"email" andPassword:@"password"];
// ...
[passwordProvider logout];
@end
