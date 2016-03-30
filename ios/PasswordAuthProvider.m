//
//  PasswordAuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "PasswordAuthProvider.h"

@implementation PasswordAuthProvider

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createProvider)
{
  return [[FirebasePasswordAuthProvider alloc] initWithRef:self.firebaseRef authDelegate:self];
}

// override
RCT_EXPORT_METHOD(login)
{
  [self.provider loginWithEmail:@"email" andPassword:@"password"];
}
@end
