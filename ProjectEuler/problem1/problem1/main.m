//
//  main.m
//  problem1
//
//  Created by Michael Metzger  on 10/5/15.
//  Copyright © 2015 Michael Metzger . All rights reserved.
//


//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

//Find the sum of all the multiples of 3 or 5 below 1000.

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int numberPool[1001];
        int sum = 0;
        
        for (int x = 0; x <= 999; x++) {
            if (x % 3 == 0 || x % 5 ==0) {
                numberPool[x] = x;
                sum = x + sum;
                
                NSLog(@"putting %d into array",numberPool[x]);
                NSLog(@"sum is now %d", sum);
            }
        }
        
    }
    return 0;
}
