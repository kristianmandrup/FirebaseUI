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

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createProvider)
{
  return [[FirebaseFacebookAuthProvider alloc] initWithRef:self.firebaseRef authDelegate:self];
}
@end
