//
//  GoogleAuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "GoogleAuthProvider.h"

@implementation GoogleAuthProvider

Firebase *firebaseRef = [[Firebase alloc] initWithUrl:@"https://<YOUR-FIREBASE-APP>.firebaseio.com/"];
FirebaseGoogleAuthProvider *googleProvider = [[FirebaseGoogleAuthProvider alloc] initWithRef:firebaseRef authDelegate:self uiDelegate:self];
[googleProvider login];
// ...
[googleProvider logout];

@end
