//
//  RNCollectionViewDataSource.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RNDataSource.h"
#import "FirebaseCollectionViewDataSource.h"
#import "RCTBridgeModule.h"

@interface RNCollectionViewDataSource : RNDataSource
@property (strong, nonatomic, __NON_NULL) FirebaseCollectionViewDataSource *dataSource;
@property (strong, nonatomic, __NON_NULL) UICollectionView *collectionView;
@end
