//
//  Wrok.m
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import "Work.h"

@implementation Work

- (id)init {
    self = [super init];
    if (self) {
        self.works = [NSMutableArray new];
    }
    return self;
}

//WorkType_invalid,
//WorkType_day,
//WorkType_halfDay,
//WorkType_night,
//WorkType_3,
//WorkType_rest


NSString *Type2String(WorkType type, NSUInteger room) {
    if (type == WorkType_invalid) {
        return @"休";
    } else if (type == WorkType_day) {
        return [NSString stringWithFormat:@"%lu", (unsigned long)room];
    } else if (type == WorkType_halfDay) {
        return [NSString stringWithFormat:@"%lu/", (unsigned long)room];
    } else if (type == WorkType_night) {
        return [NSString stringWithFormat:@"分值"];
    } else if (type == WorkType_3) {
        return [NSString stringWithFormat:@"%lu", (unsigned long)room];
    } else if (type == WorkType_rest) {
        return [NSString stringWithFormat:@"休"];
    } else {
        return @"";
    }
}

@end
