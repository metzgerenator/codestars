//
//  main.m
//  problem_5_draft1
//
//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        int numberLimit = 1;
        int answer = 1;
        
        while (numberLimit <= 20){
            int checker = answer % numberLimit;
            numberLimit += 1;
        
        if (checker != 0) {
//            NSLog(@" %d / %d does have remainder", answer, numberLimit);
            answer += 1;
            numberLimit = 1; }
        
        
        }
    
    
        NSLog(@"answer is %d", answer);
    
    
    }
   

    return 0;
}
