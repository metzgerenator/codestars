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
    
    long newIndex = arrayIndex;
    
    
    for (int x = 1; x<= 13; x++) {
        numberAdder = numberAdder * [inputArray[arrayIndex] intValue];
//        NSLog(@"%d * %@ = %d",numberAdder,inputArray[arrayIndex], numberAdder);
        NSNumber *forArray = [[NSNumber alloc]initWithInt:numberAdder];
        
//        NSLog(@"x is now %d", x);  
        
        [productInput addObject:forArray];
        
        arrayIndex = arrayIndex +1;

        
        
        if (x == 13) {
            x = 0;
            numberAdder = 1;
        }
        
        if (arrayIndex == inputArray.count -1) {
            [inputArray removeObjectAtIndex:inputArray.count - 1];
            
            arrayIndex = 0;
            
            if (inputArray.count -1 ==0) {
                // do something here with the remainder
        
                break;
            }
//            NSLog(@"arrayIndex limit is now changing to  %ld", inputArray.count -1);
        }
        

    }
    
    
    
    for (NSNumber *e in inputArray) {
        NSLog(@"%@",e);
    }
    

    
    
    
    return productInput;
}

@end
