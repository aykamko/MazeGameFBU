//
//  PlainTextMazeParserModel.m
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/22/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import "PlainTextMazeParserModel.h"

@implementation PlainTextMazeParserModel

- (NSDictionary *)screenElementDictionaryFromMazeWithString:(NSString *)mazeString
{
    NSError *error = [[NSError alloc] init];
    NSString *fileString = [NSString stringWithContentsOfFile:mazeString
                                                     encoding:NSUTF8StringEncoding
                                                        error:&error];
    NSArray *lineArray = [fileString componentsSeparatedByString:@"\n"];
    NSMutableDictionary *elementDict = [[NSMutableDictionary alloc] init];
    elementDict[@"dimensions"] = [NSMutableDictionary
                                  dictionaryWithDictionary:@{ @"rows":[NSNull null],
                                    @"columns":[NSNull null] }];
    elementDict[@"walls"] = [[NSMutableArray alloc] init];
    
    int lineCount = [lineArray count];
    elementDict[@"dimensions"][@"rows"] = @(lineCount);
    for (int i = 0; i < lineCount; i++) {
        NSString *line = lineArray[i];
        int lineLength = [line length];
        if (elementDict[@"dimensions"][@"columns"] == [NSNull null]) {
            elementDict[@"dimensions"][@"columns"] = @(lineLength);
        }
        for (int j = 0; j < lineLength; j++) {
            unichar character = [line characterAtIndex:j];
            NSArray *coords = @[@(i + 1), @(j + 1)];
            switch (character) {
                case '#': {
                    [elementDict[@"walls"] addObject:coords];
                    break;
                } case '*': {
                    elementDict[@"start"] = coords;
                    break;
                } case '$': {
                    elementDict[@"end"] = coords;
                    break;
                } default: {
                    continue;
                }
            }
        }
    }
    
    return elementDict;
}

@end
