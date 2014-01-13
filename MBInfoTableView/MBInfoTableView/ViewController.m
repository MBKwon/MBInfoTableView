//
//  ViewController.m
//  MBInfoTableView
//
//  Created by MB KWON on 2014. 1. 13..
//  Copyright (c) 2014년 Semtle_men. All rights reserved.
//

#import "ViewController.h"
#import "MBInfoTableViewDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    MBInfoTableViewDelegate *tableDelegate = [MBInfoTableViewDelegate new];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    [tableView setDataSource:tableDelegate];
    [tableView setDelegate:tableDelegate];
    
    [tableDelegate initTableView:tableView WithDictionary:@{@"test title1" : @"test description1",
                                            @"test title2" : @"test description2",
                                            @"test title3" : @"test description3",
                                            @"test title4" : @"test description4"}];
    
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
