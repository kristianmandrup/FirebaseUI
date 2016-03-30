//
//  GoogleAuthProvider.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AuthProvider.h"
#import "FirebaseGoogleAuthProvider.h"

@interface GoogleAuthProvider : AuthProvider
@property (strong, nonatomic) FirebaseGoogleAuthProvider *provider;
@end

