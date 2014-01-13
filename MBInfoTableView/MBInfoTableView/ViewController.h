//
//  ViewController.h
//  MBInfoTableView
//
//  Created by MB KWON on 2014. 1. 13..
//  Copyright (c) 2014년 Semtle_men. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBInfoTableViewDelegate;

@interface ViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) MBInfoTableViewDelegate *tableDelegate;

@end
