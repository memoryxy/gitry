//
//  PersonEngine.h
//  paiban
//
//  Created by wangjianfei on 16/6/19.
//  Copyright © 2016年 wangjianfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Work.h"

@interface PersonEngine : NSObject

@property (nonatomic, strong) NSMutableArray *persons;

- (void)assignWork:(Work *)work;

@end
