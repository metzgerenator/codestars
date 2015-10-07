//
//  main.m
//  problem_4_draft_2
//

//

#import <Foundation/Foundation.h>

int numberReverser(int input) {
    int newNumber = 0;
    int adder = 0;
    
    while (input != 0) {
        adder = input % 10;
        //        printf("adder now %d\n", adder);
        newNumber = (newNumber * 10) + adder;
        //        printf("new number now %d\n", newNumber);
        
        input = (input - adder) /10;
        
        //        printf("number input now %d\n", input);
        
    }
    
    return newNumber;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray * palindromicStorage = [[NSMutableArray alloc]init];
        int numberTracker = 999;
        int sum = 0;
        
        
        for (int e = 100; e <=numberTracker; e++){
            
            sum = e * numberTracker;
//            NSLog(@"%d x %d = %d", e,numberTracker,sum);
            int reverseNumber = numberReverser(sum);
            
            if (reverseNumber == sum) {
                
//                NSLog(@"found one %d same as %d", sum, reverseNumber );
                NSNumber *forArray = [[NSNumber alloc]initWithInt:reverseNumber];
                [palindromicStorage addObject:forArray];
                
            }
            
            
            if (e == numberTracker) {
                numberTracker = numberTracker - 1;
                
                e = 99;
            }
            
            if (numberTracker == 0) {
                break;
            }
            
        
            
        }
      
//        for (NSNumber *f in palindromicStorage) {
//            <#statements#>
//        }
        
    }
    return 0;
}








