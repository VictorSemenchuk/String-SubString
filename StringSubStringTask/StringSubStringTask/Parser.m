//
//  Parser.m
//  StringSubStringTask
//
//  Created by Victor Macintosh on 22/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "Parser.h"

@interface Parser ()
{
    NSSet *openBrackets;
    NSDictionary *closeBrackets;
}
@end

@implementation Parser

- (id)init {
    self = [super init];
    if (self) {
        openBrackets = [NSSet setWithObjects:@'(', @'[', @'<', nil];
        closeBrackets = @{@'(' : @')',
                          @'[' : @']',
                          @'<' : @'>'
                          };
    }
    return self;
}

- (NSArray *)output {
    
    NSMutableArray *outputStrings = [[[NSMutableArray alloc] init] autorelease];
    
    __block NSNumber *openBracket = nil;
    __block int openBracketsCount = 0;
    __weak typeof(self) weakSelf = self;
    
    FindStartIndex findStartIndex = ^int(int fromIndex) {
        for (int i = fromIndex; i < [[weakSelf input] length]; i++) {
            NSNumber *currChar = [NSNumber numberWithChar:[[weakSelf input] characterAtIndex:i]];
            if ([openBrackets containsObject: currChar]) {
                openBracket = currChar;
                openBracketsCount++;
                return i;
            }
        }
        return -1;
    };
    
    FindEndIndex findEndIndex = ^int(int fromIndex) {
        for (int i = fromIndex; i < [[weakSelf input] length]; i++) {
            NSNumber *currChar = [NSNumber numberWithChar:[[weakSelf input] characterAtIndex:i]];
            if ([openBrackets containsObject:currChar] && [currChar isEqual:openBracket]) {
                openBracketsCount++;
            }
            if ([[closeBrackets objectForKey:openBracket] isEqual:currChar]) {
                openBracketsCount--;
                if (openBracketsCount == 0) {
                    return i;
                }
            }
        }
        return -1;
    };
    
    int i = 0;
    while (i < [[self input] length]) {
        int startIndex = findStartIndex(i) + 1;
        if (startIndex > 0) {
            int endIndex = findEndIndex(startIndex);
            if (endIndex > 0 && endIndex > startIndex) {
                NSRange range = NSMakeRange(startIndex, endIndex - startIndex);
                NSString *outputItem = [[self input] substringWithRange:range];
                [outputStrings addObject:outputItem];
                i = startIndex;
            } else {
                i++;
            }
        } else {
            i++;
        }
    }
    
    return outputStrings;
}

- (void)dealloc {
    [_input release];
    [super dealloc];
}

@end
