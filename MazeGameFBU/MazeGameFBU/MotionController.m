//
//  MotionController.m
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/23/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import "MotionController.h"
#import <CoreMotion/CoreMotion.h>

@implementation MotionController

- (void)startGyro
{
    NSOperationQueue *gyroQueue = [[NSOperationQueue alloc] init];
    [gyroQueue setName:@"gryoQueue"];
    [[CMMotionManager alloc] startGyroUpdatesToQueue:gyroQueue withHandler:^(CMGyroData *gyroData, NSError *error) {
        NSLog(@"%@", gyroQueue);
    }];
}
@end
