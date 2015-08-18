//
//  StringCounter.m
//  numberOfWordsInString
//

#import "StringCounter.h"

@implementation StringCounter

-(NSUInteger)countOfStringInput{
    NSArray *NewArray = [self.stringInput componentsSeparatedByString:@" "];
    
    NSUInteger arrayCount = [NewArray count];
    
    return arrayCount;
}


@end



