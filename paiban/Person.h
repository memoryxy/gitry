//
//  Person.h
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Work.h"

extern const int kWeek;

@class Work;

typedef enum : NSUInteger {
    Person_normal,
    Person_0_7,
    Person_7_10,
    Person_afterBorn,
    Person_chen
} PersonType;

@interface Person : NSObject

@property (nonatomic, assign) PersonType type;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) WorkType workType;
@property (nonatomic, strong) NSMutableArray *date;
@property (nonatomic, strong) NSMutableArray *room;

@property (nonatomic, assign) double day;
@property (nonatomic, assign) NSUInteger three;
@property (nonatomic, assign) NSUInteger night;
@property (nonatomic, assign) NSUInteger rest;

@property (nonatomic, strong) NSMutableArray *works;

- (BOOL) canWork:(Work *)work;
- (void)assignWork:(Work *)work;

@end
