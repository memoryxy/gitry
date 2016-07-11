//
//  Person.m
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import "Person.h"
#import "Work.h"

const int kWeek = 4;

@implementation Person

- (id)init {
    self = [super init];
    if (self) {
        self.date = [NSMutableArray new];
        for (int i=0; i<7*kWeek+2; i++) {
            [self.date addObject:@0];
        }
        
        self.room = [NSMutableArray new];
        for (int i=0; i<7*kWeek+2; i++) {
            [self.room addObject:@0];
        }
        
        self.lastWorkedRooms = [NSMutableArray new];
    }
    return self;
}

- (BOOL) canWork:(Work *)work {
    if (self.type == Person_chen) {
        if (work.wtype == WorkType_3 || work.wtype == WorkType_night || work.day == 6 || work.day == 7) {
            return NO;
        }
        return YES;
    } else if (self.type == Person_afterBorn || self.type == Person_0_7 || self.type == Person_7_10) {
        if (work.wtype == WorkType_3 || work.wtype == WorkType_night) {
            return NO;
        }
        return YES;
    } else {
        NSNumber *current = self.date[work.index];
        if (current.unsignedIntegerValue != WorkType_invalid) {
            return NO;
        }
        
//        if ([self canRoomWorked:work] == NO) {
//            return NO;
//        }
        
//        if ([self haveWored5Days:work]) {
//            return NO;
//        }
        
        return YES;
    }
}

- (void)addWorkedRoom:(Work *)work {
    if (self.lastWorkedRooms.count >= 4) {
        [self.lastWorkedRooms removeObjectAtIndex:0];
    }
    [self.lastWorkedRooms addObject:@(work.room)];
}

- (BOOL)canRoomWorked:(Work *)work {
    for (NSNumber *room in self.lastWorkedRooms) {
        if (work.room == room.unsignedIntegerValue) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)haveWored5Days:(Work *)work {
    
    long start = 0;
    if (work.index>5) {
        start = work.index-5;
    } else {
        return NO;
    }
    
    long end = 0;
    if (work.index) {
        end = work.index;
    } else {
        return NO;
    }
    
    for (long i=start; i<end; i++) {
        if ([self.date[i] unsignedIntegerValue] == WorkType_invalid || [self.date[i] unsignedIntegerValue] ==WorkType_rest) {
            return NO;
        }
    }
    return YES;
}

- (void)assignWork:(Work *)work {
    if (work.wtype == WorkType_night) {
        self.date[work.index] = @(WorkType_night);
        self.date[work.index+1] = @(WorkType_rest);
        self.date[work.index+2] = @(WorkType_rest);
        self.night += 1;
    } else if (work.wtype == WorkType_day) {
        self.date[work.index] = @(WorkType_day);
        self.room[work.index] = @(work.room);
        [self addWorkedRoom:work];
        self.day += 1;
    } else if (work.wtype == WorkType_halfDay) {
        self.date[work.index] = @(WorkType_day);
        self.room[work.index] = @(work.room);
        [self addWorkedRoom:work];
        self.day += 0.5;
    } else if (work.wtype == WorkType_3) {
        self.date[work.index] = @(WorkType_3);
        self.three += 1;
        self.room[work.index] = @(work.room);
        [self addWorkedRoom:work];
    } else {
        assert(0);
    }
}

@end
