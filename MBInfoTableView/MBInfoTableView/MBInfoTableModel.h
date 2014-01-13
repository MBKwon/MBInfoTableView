//
//  MBInfoTableModel.h
//  MBInfoTableView
//
//  Created by MB KWON on 2014. 1. 13..
//  Copyright (c) 2014년 Semtle_men. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum MBInfoTableType {
    MBInfoTableTypeTitle = 0,
    MBInfoTableTypeDescription
} MBInfoTableType;

@interface MBInfoTableModel : NSObject

@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) MBInfoTableType cellType;
@property (assign, nonatomic, getter = isSelected) BOOL selected;

@end
