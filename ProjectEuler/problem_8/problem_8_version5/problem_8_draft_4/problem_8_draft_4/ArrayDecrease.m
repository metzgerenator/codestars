//
//  ArrayDecrease.m
//  problem_8_draft_4
//
//  Created by Michael Metzger  on 10/26/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//

#import "ArrayDecrease.h"

@implementation ArrayDecrease


-(NSMutableArray *)decreaseArray: (NSMutableArray *)inputArray{
    
    NSMutableArray *productInput = [[NSMutableArray alloc]init];
    
    
    
    int numberAdder = 1;
    
    unsigned long arrayIndex = inputArray.count - 1;
    
    //loop through 4 numbers at a time and get product
    for (int x = 13; x >= 1; x--) {
//        NSLog(@"x is now %d", x); 
        
        numberAdder = numberAdder * [inputArray[arrayIndex] intValue];
        NSNumber *forArray = [[NSNumber alloc]initWithInt:numberAdder];
        
        
        [productInput addObject:forArray];
        
        arrayIndex = arrayIndex -1;
        
        if (x == 1) {
              x = 14;
//            x = 5;
            numberAdder = 1;
        }
        
        
        
        if (arrayIndex ==0 ) {
            
            
            [inputArray removeObjectAtIndex:inputArray.count - 1];
            
            arrayIndex = inputArray.count - 1;
            
            //provide a breaking point to stop error
            if (arrayIndex == 0) {
                break;
            }
//            NSLog(@"arrayIndex is now changing to  %ld", arrayIndex);
            
            
            
        }
        
        
        
        
    }
    
    
    for (NSNumber *e in inputArray) {
        NSLog(@"left in array %@", e);
    }
    
    
    return productInput;

    
    
    
    
}






@end
