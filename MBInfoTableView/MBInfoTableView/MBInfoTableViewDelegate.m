//
//  MBInfoTableViewDelegate.m
//  MBInfoTableView
//
//  Created by MB KWON on 2014. 1. 13..
//  Copyright (c) 2014년 Semtle_men. All rights reserved.
//

#import "MBInfoTableViewDelegate.h"

@interface MBInfoTableViewDelegate ()

@property (strong, nonatomic) NSArray *totalCellArray;
@property (strong, nonatomic) NSMutableArray *titleCellArray;
@property (strong, nonatomic) NSMutableArray *descriptionCellArray;

@end

@implementation MBInfoTableViewDelegate

-(id)init
{
    self = [super init];
    if (self != nil) {
        //initialize code
        self.enableMultiSelection = NO;
    }
    
    return self;
}


-(void)initTableView:(UITableView *)tableView WithDictionary:(NSDictionary *)infoDic
{
    NSArray *allKeys = [infoDic allKeys];
    
    if (allKeys != nil) {
        
        self.titleCellArray = [NSMutableArray new];
        self.descriptionCellArray = [NSMutableArray new];
        
        for (NSString *key in allKeys) {
            
            NSString *description = [infoDic objectForKey:key];
            [self.titleCellArray addObject:key];
            [self.descriptionCellArray addObject:description];
        }
        
        self.totalCellArray = [NSArray arrayWithArray:self.titleCellArray];
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.totalCellArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.titleCellID];
    
    if (cell == nil) {
        cell = [UITableViewCell new];
    }
    
    [cell.textLabel setText:[self.totalCellArray objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

@end
