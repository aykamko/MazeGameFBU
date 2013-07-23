//
//  MotionController.m
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/23/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import "MotionController.h"
#import <CoreMotion/CoreMotion.h>

@interface MotionController ()
@property (nonatomic, strong) CMMotionManager *motionManager;
@end
@implementation MotionController

- (void)startGyro
{
    // Very broken
    
//    NSOperationQueue *gyroQueue = [[NSOperationQueue alloc] init];
//    [gyroQueue setName:@"gryoQueue"];
//    
//    self.motionManager = [[CMMotionManager alloc] init];
//    
//    if ([self.motionManager isGyroAvailable]) {
//        if ([self.motionManager isGyroActive] == NO) {
//            [self.motionManager setGyroUpdateInterval:1.0f / 2.0f];
//            [[CMMotionManager alloc] startGyroUpdatesToQueue:[NSOperationQueue mainQueue]
//                withHandler:^(CMGyroData *gyroData, NSError *error) {
//                NSLog(@"%@", gyroData);
//            }];
//        }
//    } else {
//        NSLog(@"Gyro not available");
//    }
}

@end
