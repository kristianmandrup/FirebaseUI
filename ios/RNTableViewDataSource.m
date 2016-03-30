//
//  TableViewDataSource.m
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNTableViewDataSource.h"
#import <Firebase/Firebase.h>
#import "RNTableViewDataSource.h"
#import "AppDelegate.h"

@implementation RNTableViewDataSource
RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  // make into properties
  self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];    
  self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl];
  self.reuseIdentifier = reuseIdentifier;
  self.dataSource = [[RNTableViewDataSource alloc] initWithRef:firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.tableView];

  [self.dataSource populateCellWithBlock:^(UITableViewCell *cell, FDataSnapshot *snap) {
    // Populate cell as you see fit, like as below
    cell.textLabel.text = snap.key;
  }];

  [self.tableView setDataSource:self.dataSource];
}
@end
