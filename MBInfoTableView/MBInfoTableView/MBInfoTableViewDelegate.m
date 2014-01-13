//
//  MBInfoTableViewDelegate.m
//  MBInfoTableView
//
//  Created by MB KWON on 2014. 1. 13..
//  Copyright (c) 2014년 Semtle_men. All rights reserved.
//

#import "MBInfoTableViewDelegate.h"
#import "MBInfoTableModel.h"

@interface MBInfoTableViewDelegate ()


@property (strong, nonatomic) NSMutableArray *totalCellArray;
@property (strong, nonatomic) NSMutableArray *titleCellArray;
@property (strong, nonatomic) NSMutableArray *descriptionCellArray;
@property (assign, nonatomic) NSInteger currentTag;

@end

@implementation MBInfoTableViewDelegate

-(id)init
{
    self = [super init];
    if (self != nil) {
        //initialize code
        self.enableMultiSelection = NO;
        
        self.totalCellArray = [NSMutableArray new];
        self.titleCellArray = [NSMutableArray new];
        self.descriptionCellArray = [NSMutableArray new];
    }
    
    return self;
}


-(void)initTableView:(UITableView *)tableView WithDictionary:(NSDictionary *)infoDic
{
    NSArray *allKeys = [infoDic allKeys];
    
    if (allKeys != nil) {
        
        self.titleCellArray = [NSMutableArray new];
        self.descriptionCellArray = [NSMutableArray new];
        
        int i = 0;
        for (NSString *key in allKeys) {
            
            NSString *description = [infoDic objectForKey:key];
            
            
            MBInfoTableModel *tableModel = [MBInfoTableModel new];
            [tableModel setText:key];
            [tableModel setCellType:MBInfoTableTypeTitle];
            [self.titleCellArray addObject:tableModel];
            
            tableModel = [MBInfoTableModel new];
            [tableModel setText:description];
            [tableModel setDescriptionIndex:i++];
            [tableModel setCellType:MBInfoTableTypeDescription];
            [self.descriptionCellArray addObject:tableModel];
        }
        
        self.totalCellArray = [NSMutableArray arrayWithArray:self.titleCellArray];
        [tableView reloadData];
    }
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
    
    MBInfoTableModel *tableModel = [self.totalCellArray objectAtIndex:indexPath.row];
    if (tableModel.cellType == MBInfoTableTypeTitle) {
        
        
        if (indexPath.row == 0) {
            self.currentTag = 0;
        } else {
            self.currentTag++;
        }
        
        [cell.textLabel setText:tableModel.text];
        [cell setTag:self.currentTag];
    } else {
        
        [cell.textLabel setText:tableModel.text];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MBInfoTableModel *titleModel = [self.totalCellArray objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell != nil) {
        [cell setSelected:NO];
        
        if (titleModel.cellType == MBInfoTableTypeTitle && [titleModel isSelected] == NO) {
            
            [titleModel setSelected:YES];
            MBInfoTableModel *descriptionModel = [self.descriptionCellArray objectAtIndex:cell.tag];
            
            
            [tableView beginUpdates];
            if (indexPath.row < [self.totalCellArray count]) {
                [self.totalCellArray insertObject:descriptionModel atIndex:(indexPath.row+1)];
            } else {
                
                [self.totalCellArray addObject:descriptionModel];
            }
            
            [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:(indexPath.row+1) inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
            
        } else if (titleModel.cellType == MBInfoTableTypeTitle) {
            
            [titleModel setSelected:NO];
            [self.totalCellArray removeObjectAtIndex:(indexPath.row+1)];
            [tableView beginUpdates];
            [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:(indexPath.row+1) inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            [tableView endUpdates];
        } else {
            
            if (self.selectionBlock != nil) {
                
                self.selectionBlock(titleModel.descriptionIndex);
            }
        }
    }
}


@end
