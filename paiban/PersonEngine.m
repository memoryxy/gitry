//
//  PersonEngine.m
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import "PersonEngine.h"
#import "Person.h"
#import "Work.h"

@interface PersonEngine ()


@end

@implementation PersonEngine

- (id)init {
    self = [super init];
    if (self) {
        self.persons = [NSMutableArray new];
        [self createAllPersons];
    }
    return self;
}

-(void)createAllPersons {
    Person *p = [Person new];
    p.type = Person_normal;
    p.name = @"周金红";
    NSMutableArray *persons = [NSMutableArray new];
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"汪孝信";
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"洪传美";
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"邱俊芬";
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"刘丹";
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"周余旺";
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"童文静";
    [persons addObject:p];
    
    p = [Person new];
    p.type = Person_normal;
    p.name = @"刘小英";
    [persons addObject:p];

    p = [Person new];
    p.type = Person_0_7;
    p.name = @"黄健芳";
    [persons addObject:p];

    p = [Person new];
    p.type = Person_chen;
    p.name = @"陈晓华";
    [persons addObject:p];
    
    self.persons = persons;
}

- (void)assignWork:(Work *)work {
    if (work.wtype == WorkType_day || work.wtype == WorkType_halfDay) {
        NSArray *days = [self findDayMin];
        for (Person *person in days) {
            if ([person canWork:work]) {
                [person assignWork:work];
                break;
            }
        }
    } else if (work.wtype == WorkType_night) {
        NSArray *nights = [self findNightMin];
        for (Person *person in nights) {
            if ([person canWork:work]) {
                [person assignWork:work];
                break;
            }
        }
    } else if (work.wtype == WorkType_3) {
        NSArray *threes = [self find3Min];
        for (Person *person in threes) {
            if ([person canWork:work]) {
                [person assignWork:work];
                break;
            }
        }
    }
}

- (NSArray *)findDayMin {
    NSMutableArray *result = [NSMutableArray new];
    for (Person *p in self.persons) {
        int i = 0;
        BOOL inserted = NO;
        for (Person *resutP in result.copy) {
            if (p.day < resutP.day) {
                [result insertObject:p atIndex:i];
                inserted = YES;
            }
            i++;
        }
        
        if (inserted == NO) {
            [result insertObject:p atIndex:i];
        }
    }
    
    return result;
}

- (NSArray *)findNightMin {
    NSMutableArray *result = [NSMutableArray new];
    for (Person *p in self.persons) {
        int i = 0;
        BOOL inserted = NO;
        for (Person *resutP in result.copy) {
            if (p.night < resutP.night) {
                [result insertObject:p atIndex:i];
                inserted = YES;
            }
            i++;
        }
        
        if (inserted == NO) {
            [result insertObject:p atIndex:i];
        }
    }
    return result;
}

- (NSArray *)find3Min {
    NSMutableArray *result = [NSMutableArray new];
    for (Person *p in self.persons) {
        int i = 0;
        BOOL inserted = NO;
        for (Person *resutP in result.copy) {
            if (p.three < resutP.three) {
                [result insertObject:p atIndex:i];
                inserted = YES;
            }
            i++;
        }
        
        if (inserted == NO) {
            [result insertObject:p atIndex:i];
        }
    }
    return result;
}


@end
