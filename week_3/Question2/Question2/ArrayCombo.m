//
//  ArrayCombo.m
//  Question2
//

//

#import "ArrayCombo.h"

@implementation ArrayCombo


-(NSArray*)arrayCombinator:(NSArray*)arrayOne inputTwo:(NSArray*)arrayTwo{
    
    NSMutableArray *newArrayCombo = [[NSMutableArray alloc]init];
    
    
    for (NSArray* d in arrayOne) {
        [newArrayCombo addObject:d];
    }
    
    for (NSArray* e in arrayTwo) {
        [newArrayCombo addObject:e];
    }
    
    
    
    return newArrayCombo;
    
}




@end
