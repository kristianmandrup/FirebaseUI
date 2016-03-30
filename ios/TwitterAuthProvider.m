//
//  TwitterAuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "TwitterAuthProvider.h"
#import "FirebaseTwitterAuthProvider.h"

@implementation TwitterAuthProvider

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(createProvider)
{
  return [[FirebaseTwitterAuthProvider alloc] initWithRef:self.firebaseRef authDelegate:self twitterDelegate:self];
}

@end
