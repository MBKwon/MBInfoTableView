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
    
    [self.tableDelegate initTableView:self.tableView WithDictionary:@{@"test title1" : @"test description1",
                                            @"test title2" : @"test description2",
                                            @"test title3" : @"test description3",
                                            @"test title4" : @"test description4"}];
    
    
    [self.tableDelegate setSelectionBlock:^(int cellTag) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"You selected a cell that is a tag %d", cellTag] delegate:nil cancelButtonTitle:@"Confirm" otherButtonTitles:nil];
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
