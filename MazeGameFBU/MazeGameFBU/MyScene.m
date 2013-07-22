//
//  MyScene.m
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/22/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import "MyScene.h"
#import "MazeGrid.h"

@interface MyScene ()
@property (nonatomic, strong) MazeGrid *grid;
@end
@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        self.anchorPoint = CGPointMake(0.5, 0.5);
        _grid = [[MazeGrid alloc] initWithRows:3 andColumns:3];
        CGFloat xPos = -(_grid.size.width / 2.0);
        CGFloat yPos = (_grid.size.height / 2.0);
        _grid.position = CGPointMake(xPos, yPos);
        [self addChild:_grid];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [[self grid] placeBlockAtRow:2 andColumn:3];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end