//
//  MBInfoTableViewDelegate.h
//  MBInfoTableView
//
//  Created by MB KWON on 2014. 1. 13..
//  Copyright (c) 2014년 Semtle_men. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBInfoTableViewDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSString *titleCellID;
@property (strong, nonatomic) NSString *descriptionCellID;

@property (assign, nonatomic, getter = isEnableMultiSelection) BOOL enableMultiSelection;


-(void)initTableView:(UITableView *)tableView WithDictionary:(NSDictionary *)infoDic;

@end
