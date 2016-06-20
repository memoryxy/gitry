//
//  Wrok.h
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    WorkType_invalid,
    WorkType_day,
    WorkType_halfDay,
    WorkType_night,
    WorkType_3,
    WorkType_rest
} WorkType;

@interface Work : NSObject

@property (nonatomic, strong) NSMutableArray *works;
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, assign) WorkType wtype;
@property (nonatomic, assign) NSUInteger room;

@property (nonatomic, assign) NSUInteger week;
@property (nonatomic, assign) NSUInteger day;

@end

NSString *Type2String(WorkType type, NSUInteger room);