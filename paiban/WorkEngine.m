//
//  WorkEngine.m
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import "WorkEngine.h"
#import "Work.h"

@implementation WorkEngine

- (id)init {
    self = [super init];
    if (self) {
        self.days = [NSMutableArray new];
        self.nights = [NSMutableArray new];
        self.threes = [NSMutableArray new];
        
//        [self createAllWorks];
    }
    return self;
}

//- (void)createAllWorks {
//    int week = 0;
//    for (int day=0; day<7; day++) {
//        for (int room=0; room<7; room++) {
//            if (room == 3) {
//                Work *awork = [Work new];
//                awork.week = week;
//                awork.day = day;
//                WorkCell *tiny = [WorkCell new];
//                tiny.type = WorkType_3;
//                [awork.works addObject:tiny];
//                [self.threes addObject:awork];
//            } else if (room == 7) {
//                if (day == 2) {
//                    Work *awork = [Work new];
//                    awork.week = week;
//                    awork.day = day;
//                    WorkCell *tiny = [WorkCell new];
//                    tiny.type = WorkType_halfDay;
//                    [awork.works addObject:tiny];
//                    [self.days addObject:awork];
//                }
//            } else if (room == 5 && day == 5) {
//                Work *awork = [Work new];
//                awork.week = week;
//                awork.day = day;
//                WorkCell *tiny = [WorkCell new];
//                tiny.type = WorkType_halfDay;
//                [awork.works addObject:tiny];
//                [self.days addObject:awork];
//            } else {
//                Work *awork = [Work new];
//                awork.week = week;
//                awork.day = day;
//                WorkCell *tiny = [WorkCell new];
//                tiny.type = WorkType_day;
//                [awork.works addObject:tiny];
//                [self.days addObject:awork];
//            }
//        }
//        
//        // night
//        Work *awork = [Work new];
//        awork.week = week;
//        awork.day = day;
//        WorkCell *tiny1 = [WorkCell new];
//        tiny1.type = WorkType_rest;
//        
//        WorkCell *tiny2 = [WorkCell new];
//        tiny2.type = WorkType_night;
//        
//        WorkCell *tiny3 = [WorkCell new];
//        tiny3.type = WorkType_rest;
//        
//        WorkCell *tiny4 = [WorkCell new];
//        tiny4.type = WorkType_rest;
//        
//        [awork.works addObjectsFromArray:@[tiny1, tiny2, tiny3, tiny4]];
//        [self.nights addObject:awork];
//        
//        week++;
//    }
//}

@end
