//
//  SocialAuth.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNSocialAuth.h"
#import "RCTLog.h"
@implementation RNSocialAuth
RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(showImage:(NSString *)url)
{
  // Here's our method's code
  RCTLogInfo(@"SocialAuth called! %@", url);
}
@end