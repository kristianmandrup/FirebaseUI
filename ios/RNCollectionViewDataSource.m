//
//  RNCollectionViewDataSource.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNCollectionViewDataSource.h"
#import <Firebase/Firebase.h>
#import "FirebaseTableViewDataSource.h"
#import "AppDelegate.h"

@implementation RNCollectionViewDataSource
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];
  self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl];
  self.reuseIdentifier = reuseIdentifier;

  self.dataSource = [[FirebaseTableViewDataSource alloc] initWithRef:firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.CollectionView];

  [self.dataSource populateCellWithBlock:^(UICollectionViewCell *cell, FDataSnapshot *snap) {
    // Populate cell as you see fit, like as below
    cell.backgroundColor = [UIColor blueColor];
  }];

  [self.collectionView setDataSource:self.dataSource];
}
@end
