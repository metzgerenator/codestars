//
//  main.m
//  problem_3
//
//  Copyright © 2015 Mike. All rights reserved.

//The prime factors of 13195 are 5, 7, 13 and 29.
//
//What is the largest prime factor of the number 600851475143 ?


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *factorStorage = [[NSMutableArray alloc]initWithObjects:@2,@3,@5,@7,@11,@13, nil];
        
        long inputNumber = 600851475143;
        
        // populate array with prime numbers
        for (int x = 2; x < 10000; x++) {
            if  (x % 2 != 0 && x % 3 != 0 &&  x % 5 != 0 &&  x % 7 != 0 &&  x % 11 != 0) {
                        NSNumber *inputForArray = [[NSNumber alloc]initWithInt:x];
                        [factorStorage addObject:inputForArray];
                NSLog(@"adding %@ to array", inputForArray);
                    }
                }
        
        for (int x = 0; x < factorStorage.count; x++) {
            if (inputNumber % [factorStorage[x] intValue] == 0) {
                inputNumber = inputNumber / [factorStorage[x] intValue];
                
                
                NSLog(@" %d is a factor", [factorStorage[x] intValue]);
                NSLog(@"input number is now %ld", inputNumber);
                x = 0;
            }
        }


            }
    
        
        
    
    return 0;
}
