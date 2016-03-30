//
//  TableViewDataSource.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>
#import "FirebaseTableViewDataSource.h"
#import "RCTBridgeModule.h"

@interface RNTableViewDataSource : NSObject <RCTBridgeModule>
  @property (strong, nonatomic) String *firebaseUrl;
  @property (strong, nonatomic) String *reuseIdentifier;
  @property (strong, nonatomic) Firebase *firebaseRef;
  @property (strong, nonatomic) FirebaseTableViewDataSource *dataSource;
@end

