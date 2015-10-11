//
//  main.m
//  problem_7

//By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
//
//What is the 10 001st prime number?

//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        int answer = 3;
        int x = 2;
        int ticker = 1;

        
        for ( ;x < (answer); x++) {
            
            int checker = answer % x;
            
            // clear out non primes
            if (checker == 0) {
                answer += 1;
                x = 1;
                
                
                
                // take action on primes
            } else if (x == (answer -1)) {
                ticker += 1;
                NSLog(@" prime %d is the %d'st prime", answer, ticker);
                
                answer += 1;
                x = 1;
                
                
                //pause search if ticker equals 10001
            } else if (ticker == 10001) {
                break;
            }
            
            
        }
        
        
        
        
        
        
        
        
    }
    return 0;
}
