//
//  main.m
//  problem_6
//
//The sum of the squares of the first ten natural numbers is,
//
//12 + 22 + ... + 102 = 385
//The square of the sum of the first ten natural numbers is,
//
//(1 + 2 + ... + 10)2 = 552 = 3025
//Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.
//
//Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        int square1stTenNaturalNumbers = 0;
        
        int squaredNumberInput = 0;
        
        int squareOfSum = 0;
        
        int answer = 0;
        
        int x = 0;
        
        while (x <= 100) {
            
            //square of 1st Natural numer operations
            squaredNumberInput = x * x;
            NSLog(@"%d squared is %d",x ,squaredNumberInput);
            
            square1stTenNaturalNumbers += squaredNumberInput;
            
            NSLog(@"squared1stNat is now %d", square1stTenNaturalNumbers);
            
            //square of sum operations
            squareOfSum += x;
            NSLog(@" sqare of sum is now %d", squareOfSum);
           
            x += 1;
            
            NSLog(@" x is now %d", x);
            
        }
        
        squareOfSum = squareOfSum * squareOfSum;
        NSLog(@"final square of sum is %d", squareOfSum);
        
        answer = squareOfSum - square1stTenNaturalNumbers;
        NSLog(@"answer is %d", answer);
        
        
        
        
        
        
    }
    return 0;
}
