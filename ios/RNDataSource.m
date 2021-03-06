//
//  RNDataSource.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNDataSource.h"
#import <Firebase/Firebase.h>

@implementation RNDataSource
RCT_EXPORT_MODULE();

// synthesize getters and setters which also allows for . access syntax :) 
@synthesize firebaseUrl=_firebaseUrl;
@synthesize firebaseRef=firebaseRef;
@synthesize reuseIdentifier=_reuseIdentifier;
@synthesize dataSource=_dataSource;

RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];
  self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl];
  self.reuseIdentifier = reuseIdentifier;
  self.dataSource = [self.createDataSource];
  return self;
}
@end
