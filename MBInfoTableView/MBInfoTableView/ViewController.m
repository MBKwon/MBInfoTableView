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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 470) style:UITableViewStylePlain];
    self.tableDelegate = [[MBInfoTableViewDelegate alloc] init];
    
    
    [self.tableView setDataSource:self.tableDelegate];
    [self.tableView setDelegate:self.tableDelegate];
    
    [self.tableDelegate initTableView:self.tableView WithDictionary:@{@"test title 1" : @"test description 1",
                                            @"test title 2" : @"test description 2",
                                            @"test title 3" : @"test description 3",
                                            @"test title 4" : @"test description 4"}];
    
    
    [self.tableDelegate setSelectionBlock:^(int cellTag) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"A description index is %d you selected", cellTag] delegate:nil cancelButtonTitle:@"Confirm" otherButtonTitles:nil];
        [alertView show];
    }];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
