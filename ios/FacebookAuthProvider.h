//
//  FacebookAuthProvider.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AuthProvider.h"
#import "FirebaseFacebookAuthProvider.h"

@interface FacebookAuthProvider : AuthProvider
@property (strong, nonatomic) FirebaseFacebookAuthProvider *provider;
@end
