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
@property (nonatomic) float squareLength;

@end

@implementation MazeGrid

- (instancetype)initWithRows:(NSInteger)rows
                     columns:(NSInteger)columns
                squareLength:(float)length
             backgroundColor:(UIColor *)color
{
    CGSize boardSize = CGSizeMake(columns * length,
                                  rows * length);
    self = [super initWithColor:color
                           size:boardSize];
    if (self) {
        _squareLength = length;
        self.anchorPoint = CGPointMake(0, 1);
        NSMutableArray *centersArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < rows; i++) {
            NSMutableArray *subArray = [[NSMutableArray alloc] init];
            for (int j = 0; j < columns; j++) {
                CGFloat xPos = _squareLength/2 + (_squareLength * j);
                CGFloat yPos = -(_squareLength/2 + (_squareLength * i));
                CGPoint point = CGPointMake(xPos, yPos);
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
                          spriteNodeWithColor:[UIColor brownColor]
                          size:CGSizeMake(_squareLength, _squareLength)];
    node.anchorPoint = CGPointMake(0.5, 0.5);
    node.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:node.size];
    node.physicsBody.dynamic = NO;
    NSValue *positionValue = [self gridCenters][row - 1][column - 1];
    CGPoint position = [positionValue CGPointValue];
    node.position = position;
    [self addChild:node];
}

- (void)placeStartAtRow:(NSInteger)row andColumn:(NSInteger)column
{
    
    SKShapeNode *node = [[SKShapeNode alloc] init];
    node.path = [self bezierPathForCircleOfRadius:(_squareLength / 4)].CGPath;
    node.glowWidth = 0;
    node.strokeColor = [UIColor magentaColor];
    node.fillColor = [UIColor magentaColor];
    node.physicsBody = [SKPhysicsBody
                        bodyWithCircleOfRadius:(_squareLength / 4)];
    node.physicsBody.usesPreciseCollisionDetection = YES;
    NSValue *positionValue = [self gridCenters][row - 1][column - 1];
    CGPoint position = [positionValue CGPointValue];
    node.position = position;
    [self addChild:node];
}

- (void)placeEndAtRow:(NSInteger)row andColumn:(NSInteger)column
{
    SKSpriteNode *node = [SKSpriteNode
                          spriteNodeWithColor:[UIColor redColor]
                          size:CGSizeMake(_squareLength / 2, _squareLength / 2)];
    node.anchorPoint = CGPointMake(0.5, 0.5);
    NSValue *positionValue = [self gridCenters][row - 1][column - 1];
    CGPoint position = [positionValue CGPointValue];
    node.position = position;
    [self addChild:node];
}

- (UIBezierPath *)bezierPathForCircleOfRadius:(float)radius
{
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(0, 0)
                    radius:radius
                startAngle:0.0
                  endAngle:M_PI * 2.0
                 clockwise:YES];
    return path;
}
@end
