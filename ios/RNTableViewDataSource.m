//
//  TableViewDataSource.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNTableViewDataSource.h"
#import <Firebase/Firebase.h>
#import "AppDelegate.h"

@implementation RNTableViewDataSource
RCT_EXPORT_MODULE();

// do we need this to export if we only call super or are subclass methods auto available?
RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  [super init];
}

- (FirebaseTableViewDataSource) createDataSource
{
  return [[FirebaseTableViewDataSource alloc]
          initWithRef:self.firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.tableView];
}

RCT_EXPORT_METHOD(setup)
{

  [self.dataSource populateCellWithBlock:^(UITableViewCell *cell, FDataSnapshot *snap) {
    // Populate cell as you see fit, like as below
    cell.textLabel.text = snap.key;
  }];

  [self.tableView setDataSource:self.dataSource];
}
@end
