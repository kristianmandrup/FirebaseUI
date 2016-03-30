//
//  TwitterAuthProvider.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AuthProvider.h"
#import "FirebaseTwitterAuthProvider.h"

@interface TwitterAuthProvider : AuthProvider
@property (strong, nonatomic) FirebaseTwitterAuthProvider *provider;
@end
