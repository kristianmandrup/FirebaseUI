//
//  RNCollectionViewDataSource.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTBridgeModule.h"

@interface RNCollectionViewDataSource : NSObject <RCTBridgeModule>
@property (strong, nonatomic) String *firebaseUrl;
@property (strong, nonatomic) String *reuseIdentifier;
@property (strong, nonatomic) Firebase *firebaseRef;
@property (strong, nonatomic) FirebaseCollectionViewDataSource *dataSource;
@end
