//
//  main.m
//  numberOfVowels4
//
//  Question #2 Create a method that takes a string as its input and returns the number of vowels that appear in the string.
//

#import <Foundation/Foundation.h>
#import "NumberofVowels.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NumberofVowels *stringOne = [[NumberofVowels alloc]init];
        stringOne.stringInput = @"Computers are Fun";
        stringOne.vowels = @"aeiou";
        
        
        NSLog(@"The answer to question 3 is = %ld", stringOne.stringComparison);
    
        

        
        
    }
    return 0;
}
