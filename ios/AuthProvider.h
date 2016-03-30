//
//  AuthProvider.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>
#import "RCTBridgeModule.h"

@interface AuthProvider : NSObject <RCTBridgeModule>
@property (strong, nonatomic) NSString *firebaseUrl;
@property (strong, nonatomic) Firebase *firebaseRef;
- (NSObject)createProvider;
@end
