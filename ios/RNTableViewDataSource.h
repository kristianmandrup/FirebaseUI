//
//  TableViewDataSource.h
//  FirebaseUI
//
//  Created by Kristian Mandrup on 30/03/2016.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RNDataSource.h"
#import "FirebaseTableViewDataSource.h"
#import "RCTBridgeModule.h"

@interface RNTableViewDataSource : RNDataSource
  @property (strong, nonatomic, __NON_NULL) FirebaseTableViewDataSource *dataSource;
  @property (strong, nonatomic, __NON_NULL) UITableView *tableView;
@end

