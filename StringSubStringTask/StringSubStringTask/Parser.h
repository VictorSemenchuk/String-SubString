//
//  Parser.h
//  StringSubStringTask
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int(^FindStartIndex)(int);
typedef int(^FindEndIndex)(int);

@interface Parser : NSObject

@property (retain, nonatomic) NSString *input;

- (NSArray *)output;

@end
