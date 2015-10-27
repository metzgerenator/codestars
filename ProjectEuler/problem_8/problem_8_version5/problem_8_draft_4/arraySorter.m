//
//  arraySorter.m
//  problem_8_draft_4
//
//
//

#import "arraySorter.h"

@implementation arraySorter

-(NSMutableArray*)arraySorter: (NSMutableArray*)inputArray{
    
    [inputArray insertObject:@1 atIndex:0];
    
    NSMutableArray *finalArray = [[NSMutableArray alloc]init];
    
    
    
    int product = 1;
    long index = 0;
    long arrayCount = inputArray.count;
    NSLog(@"starting arraycount is %ld", arrayCount);
    
    int cycles = 0;
    int indexcycles = 0;
    
    for (int x = 0; x < arrayCount; x++) {
        product = product * [inputArray[index] intValue];
//                    NSLog(@"index is %ld and arraycount is now %ld", index, arrayCount);

        index += 1;
        
        if (x == 13) {
            x = 0;
            
            indexcycles += 1;
            NSNumber *arrayInput = [[NSNumber alloc]initWithLong:product];
            [finalArray addObject:arrayInput];
            product = 1;
            
            
        }
        
        if (index == arrayCount) {
//            NSLog(@"arrayCount is now is now %ld   index is now %ld", arrayCount, index);
            
            index = 0;
            x = 0;
//            arrayCount -= 1;
            product = 1;
            [inputArray removeObjectAtIndex:arrayCount -1];
            [inputArray removeObjectAtIndex:0];
            arrayCount = inputArray.count;
            
            cycles +=1;
        }
  
        
    }
    
    NSLog(@"final arrayCount is now is now %ld final index is now %ld", arrayCount, index);
    NSLog(@"number of cycles %d", cycles);
     NSLog(@"number of index cycles %d", indexcycles);
    
    
    return finalArray;
}

@end
