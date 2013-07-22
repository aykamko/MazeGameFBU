//
//  MazeGrid.m
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/22/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import "MazeGrid.h"

@interface MazeGrid ()

@property (nonatomic, strong) NSArray *gridCenters;

@end

@implementation MazeGrid

- (instancetype)initWithRows:(NSInteger)rows andColumns:(NSInteger)columns
{
    CGSize boardSize = CGSizeMake(columns * 100, rows * 100);
    self = [super initWithColor:[UIColor orangeColor]
                           size:boardSize];
    if (self) {
        self.anchorPoint = CGPointMake(0, 1);
        NSMutableArray *centersArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < rows; i++) {
            NSMutableArray *subArray = [[NSMutableArray alloc] init];
            for (int j = 0; j < columns; j++) {
                CGFloat xPos = 50 + (100 * j);
                CGFloat yPos = 50 + (100 * i);
                CGPoint point = CGPointMake(xPos, yPos);
                NSLog(@"%f, %f", point.x, point.y);
                NSValue *value = [NSValue valueWithCGPoint:point];
                [subArray addObject:value];
            }
            [centersArray addObject:subArray];
        }
        _gridCenters = [NSArray arrayWithArray:centersArray];
    }
    return self;
}

- (void)placeBlockAtRow:(NSInteger)row andColumn:(NSInteger)column
{
    SKSpriteNode *node = [SKSpriteNode
                          spriteNodeWithColor:[UIColor magentaColor]
                          size:CGSizeMake(100, 100)];
    node.anchorPoint = CGPointMake(0.5, 0.5);
    NSValue *positionValue = [self gridCenters][row - 1][column - 1];
    CGPoint position = [positionValue CGPointValue];
    node.position = position;
    [self addChild:node];
}

@end
