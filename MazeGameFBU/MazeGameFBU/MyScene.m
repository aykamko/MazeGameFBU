//
//  MyScene.m
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/22/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import "MyScene.h"
#import "MazeGrid.h"
#import "PlainTextMazeParserModel.h"

@interface MyScene ()
@property (nonatomic, strong) MazeGrid *grid;
@end
@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        self.anchorPoint = CGPointMake(0.5, 0.5);
        
        PlainTextMazeParserModel *parser =
            [[PlainTextMazeParserModel alloc] init];
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"1-1" ofType:@"txt"];
        NSDictionary *objects =
            [parser screenElementDictionaryFromMazeWithString:path];
        
        NSInteger rows = [objects[@"dimensions"][@"rows"] intValue];
        NSInteger columns = [objects[@"dimensions"][@"columns"] intValue];
        _grid = [[MazeGrid alloc] initWithRows:rows
                                       columns:columns
                                  squareLength:25.0
                               backgroundColor:[UIColor blackColor]];
        CGFloat xPos = -(_grid.size.width / 2.0);
        CGFloat yPos = (_grid.size.height / 2.0);
        _grid.position = CGPointMake(xPos, yPos);
        [self addChild:_grid];
        
        for (NSArray *wall in objects[@"walls"]) {
            [[self grid] placeBlockAtRow:[wall[0] intValue]
                               andColumn:[wall[1] intValue]];
        }
        NSArray *startCoords = objects[@"start"];
        [[self grid] placeStartAtRow:[startCoords[0] intValue]
                           andColumn:[startCoords[1] intValue]];
        NSArray *endCoords = objects[@"end"];
        [[self grid] placeEndAtRow:[endCoords[0] intValue]
                           andColumn:[endCoords[1] intValue]];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    [[self grid] placeBlockAtRow:1 andColumn:2];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end