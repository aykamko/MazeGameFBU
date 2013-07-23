//
//  PlainTextMazeParserModel.h
//  MazeGameFBU
//
//  Created by Aleks Kamko on 7/22/13.
//  Copyright (c) 2013 Aleks Kamko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlainTextMazeParserModel : NSObject

- (NSDictionary *)screenElementDictionaryFromMazeWithString:(NSString *)mazeString;

@end
