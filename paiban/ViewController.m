//
//  ViewController.m
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import "ViewController.h"
#import "Work.h"
#import "Person.h"
#import "WorkEngine.h"
#import "PersonEngine.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PersonEngine *eigine = [PersonEngine new];
    int index = 0;
    for (int week=0; week < 8; week++) {
        for (int day=1; day<8; day++) {
            // night
            Work *awork = [Work new];
            awork.week = week;
            awork.day = day;
            awork.wtype = WorkType_night;
            awork.index = index;
            [eigine assignWork:awork];

            
            // 3#
            awork = [Work new];
            awork.week = week;
            awork.day = day;
            awork.wtype = WorkType_3;
            awork.index = index;
            awork.room = 3;
            [eigine assignWork:awork];

            for (int room=1; room<8; room++) {
                Work *awork = [Work new];
                awork.week = week;
                awork.day = day;
                awork.room = room;
                awork.index = index;
                if (room == 3) {
                } else if (room == 7) {
                    if (day == 2) {
                        awork.wtype = WorkType_halfDay;
                    }
                } else if (room == 5 && day == 5) {
                    awork.wtype = WorkType_halfDay;
                }  else if (room == 5 && (day == 6 || day == 7)) {
                }  else if (room == 6 && (day == 6 || day == 7)) {
                } else {
                    awork.wtype = WorkType_day;
                }
                if (awork.wtype != WorkType_invalid) {
                    [eigine assignWork:awork];
                }
            }
            
            index++;
        }
    }
    
    
    
    // 打印模块
    NSString *resultStr = @"";
    
    //打印表1
    NSString *str = [NSString stringWithFormat:@" "];
    for (int i=0; i<56; i++) {
        str = [str stringByAppendingFormat:@",星期%d", i%7+1];
        if (i % 7 == 6) {
            str = [str stringByAppendingFormat:@", "];
        }
    }
    str = [str stringByAppendingString:@"\n"];
    resultStr = [resultStr stringByAppendingString:str];

    
    for (Person *person in eigine.persons) {
        NSString *str = [NSString stringWithFormat:@"%@", person.name];
        for (int i=0; i<person.date.count; i++) {
            NSNumber *nb = person.date[i];
            NSNumber *room= person.room[i];
            str = [str stringByAppendingFormat:@",%@", Type2String(nb.unsignedIntegerValue, room.unsignedIntegerValue)];
            
            if (i % 7 == 6) {
                str = [str stringByAppendingFormat:@", "];
            }
        }
        
        str = [str stringByAppendingString:@"\n"];
        
        resultStr = [resultStr stringByAppendingString:str];
    }
    
    resultStr = [resultStr stringByAppendingString:@"\n"];
    resultStr = [resultStr stringByAppendingString:@"\n"];
    //打印表2
    str = [NSString stringWithFormat:@"(天),白班,夜班,3号"];
    str = [str stringByAppendingString:@"\n"];
    resultStr = [resultStr stringByAppendingString:str];
    for (Person *person in eigine.persons) {
        NSString *str = [NSString stringWithFormat:@"%@,%.1f,%d,%d", person.name, person.day, person.night, person.three];
        str = [str stringByAppendingString:@"\n"];
        resultStr = [resultStr stringByAppendingString:str];
    }
    
    NSLog(@"%@", resultStr);
    
    // 备注：5号房间为主任，需要自己添加
    // 5号房间的下午和7号房间的上午叠加在一起
    // 去开化的需要处理
    
    int x = 1;
    x=2;
}

@end
