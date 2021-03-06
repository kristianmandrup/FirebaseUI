//
//  RNCollectionViewDataSource.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNCollectionViewDataSource.h"
#import <Firebase/Firebase.h>
#import "AppDelegate.h"
#import "FirebaseCollectionViewDataSource.h"

@implementation RNCollectionViewDataSource
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  return [super init];
}

- (FirebaseCollectionViewDataSource*) createDataSource
{
  return [[FirebaseCollectionViewDataSource alloc] initWithRef:self.firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.collectionView];
}

RCT_EXPORT_METHOD(setup)
{
  [self.dataSource populateCellWithBlock:^(UICollectionViewCell *cell, FDataSnapshot *snap) {
    // Populate cell as you see fit, like as below
    cell.backgroundColor = [UIColor blueColor];
  }];

  [self.collectionView setDataSource:self.dataSource];
}
@end
