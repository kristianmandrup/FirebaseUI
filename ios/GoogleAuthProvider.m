//
//  GoogleAuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "GoogleAuthProvider.h"
#import "FirebaseGoogleAuthProvider.h"

@implementation GoogleAuthProvider

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createProvider)
{
  return [[FirebaseGoogleAuthProvider alloc] initWithRef:self.firebaseRef authDelegate:self uiDelegate:self];
}
@end
