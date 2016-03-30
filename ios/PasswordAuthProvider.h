//
//  PasswordAuthProvider.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "FirebasePasswordAuthProvider.h"
#import "AuthProvider.h"

@interface PasswordAuthProvider : AuthProvider
@property (strong, nonatomic) FirebasePasswordAuthProvider *provider;
@end

