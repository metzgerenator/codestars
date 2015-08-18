//
//  main.m
//  Question2
////
//2) Write a function that takes two NSArrays as arguments and returns another NSArray that is the combination of the two arrays. For example, if I pass the following arrays @[@1, @2, @3] and @[@4, @5, @6] it will return @[@1, @2, @3, @4, @5, @6].

#import <Foundation/Foundation.h>
#import "ArrayCombo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSArray *BoeingPlanes = @[@"777", @"747", @"787", @"737"];
        NSArray *AirBusPlanes = @[@"a380", @"a320", @"a321", @"a319"];

        ArrayCombo *newCombo = [[ArrayCombo alloc]init];
        
        NSArray *planes = [newCombo arrayCombinator:BoeingPlanes inputTwo:AirBusPlanes];
        
        for (NSArray *model in planes) {
            NSLog(@"the answer to 2 is %@",model);
        }
        
        
    }
    return 0;
}
