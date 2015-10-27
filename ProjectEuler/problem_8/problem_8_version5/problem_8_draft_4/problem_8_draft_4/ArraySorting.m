//
//  ArraySorting.m
//  problem_8_draft_4
//
//  Created by Michael Metzger  on 10/26/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "ArraySorting.h"

@implementation ArraySorting

-(NSArray *)arraysorter:(NSArray *)inputArray {
    NSArray *sorted = [inputArray sortedArrayUsingComparator:^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return  (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [ obj2 integerValue]) {
            return  (NSComparisonResult) NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];

    
    return sorted;
}

@end
