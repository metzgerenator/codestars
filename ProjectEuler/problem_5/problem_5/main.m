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
        
        int dividerInput [20] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        int answer = 1;
        
        for (int x = 0; x < 20; x++) {
            int checker = answer % dividerInput[x];
//            NSLog(@"answer is now %d, divider is now %d", answer, dividerInput[x]);
            
            if (checker !=0 ) {
                answer += 1;
                x = 0;
//                NSLog(@"answer is now %d, divider is now %d", answer, dividerInput[x]);
            }
        }
        
        NSLog(@"answer is %d", answer);
        
    }
    return 0;
}
