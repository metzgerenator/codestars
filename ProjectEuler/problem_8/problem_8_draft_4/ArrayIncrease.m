//
//  ArrayIncrease.m
//  problem_8_draft_4
//


#import "ArrayIncrease.h"

@implementation ArrayIncrease


-(NSMutableArray *)arryIncreaeSorter: (NSMutableArray*)inputArray {
    
    NSMutableArray *productInput = [[NSMutableArray alloc]init];
    
    int numberAdder = 1;
    
    unsigned long arrayIndex = 0;
    
    
    for (int x = 1; x<= 4; x++) {
        numberAdder = numberAdder * [inputArray[arrayIndex] intValue];
        NSNumber *forArray = [[NSNumber alloc]initWithInt:numberAdder];
        
        [productInput addObject:forArray];
        
        arrayIndex = arrayIndex +1;
//        NSLog(@"arrayindex is now %ld", arrayIndex);
        
        
        if (x == 4) {
            x = 0;
            numberAdder = 1;
        }
        
        if (arrayIndex == inputArray.count -1) {
            [inputArray removeObjectAtIndex:inputArray.count - 1];
            
            arrayIndex = 0;
            
            if (inputArray.count -1 ==0) {
                break;
            }
            NSLog(@"arrayIndex limit is now changing to  %ld", inputArray.count -1);
        }
        

    }
    
    
    return productInput;
}

@end
