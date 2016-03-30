//
//  FacebookAuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "FacebookAuthProvider.h"

@implementation FacebookAuthProvider

// See https://www.firebase.com/docs/ios/guide/login/facebook.html

Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
FirebaseFacebookAuthProvider *provider = [[FirebaseFacebookAuthProvider alloc] initWithRef:firebaseRef authDelegate:self];

// login
[provider login];

// logout
[provider logout];

@end
