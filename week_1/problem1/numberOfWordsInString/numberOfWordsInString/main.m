//
//  main.m
//  numberOfWordsInString

//1) Create a method that returns the number of words that are in a string.

#import <Foundation/Foundation.h>
#import "StringCounter.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       //Create instance of StringCounter
        StringCounter *newString = [[StringCounter alloc]init];
        
        //create instance variable
        newString.stringInput = @"Computers are a lot of fun";
        
        //Use method from implementation
        NSUInteger howManywords = newString.countOfStringInput;
        
        NSLog(@"The answer to question 1 is %ld", howManywords);
       
        
        
    }
    return 0;
}




