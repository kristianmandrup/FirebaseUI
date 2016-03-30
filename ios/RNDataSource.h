//
//  RNDataSource.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FirebaseTableViewDataSource.h"
#import "RCTBridgeModule.h"

@interface RNDataSource : NSObject <RCTBridgeModule>
@property (strong, nonatomic, __NON_NULL) NSString *firebaseUrl;
@property (strong, nonatomic, __NON_NULL) NSString *reuseIdentifier;
@property (strong, nonatomic, __NON_NULL) Firebase *firebaseRef;

- (id) init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier;
@end
