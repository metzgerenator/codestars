//
//  main.m
//  problem_5
//
//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int numberStarter = 1;
        int numberDivider = 10;
      
        while (numberStarter % numberDivider != 0) {
           
            numberStarter += 1;
            numberDivider = 10;
            
            if (numberStarter % numberDivider == 0) {
                
//                numberStarter = numberStarter;
                numberDivider = numberDivider -1;
                NSLog(@"numberStarter is now %d numberDivider is now %d", numberStarter, numberDivider);
                
            }
        }
        
    }
    return 0;
}
