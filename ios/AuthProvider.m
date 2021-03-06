//
//  AuthProvider.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AuthProvider.h"
#import <Firebase/Firebase.h>

@implementation AuthProvider

RCT_EXPORT_METHOD(init:(NSString *)appName)
{
  self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];
  self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl];
  self.provider = [self.createProvider];
}
@end
