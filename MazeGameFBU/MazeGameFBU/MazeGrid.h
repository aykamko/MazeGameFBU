//
//  MazeGrid.h
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/22/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MazeGrid : SKSpriteNode

- (instancetype)initWithRows:(NSInteger)rows andColumns:(NSInteger)columns;
- (void)placeBlockAtRow:(NSInteger)row andColumn:(NSInteger)column;

@end
