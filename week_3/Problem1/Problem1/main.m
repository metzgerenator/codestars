//
//  main.m
//  Problem1
//1) Write a function that takes an NSSArray of strings as an argument and returns a new NSArray of the same strings capitalized. For example, if I were to pass the following array @[@"cat", @"dog", @"frog"] it would return @[@"CAT", @"DOG", @"FROG"].

//

#import <Foundation/Foundation.h>
#import "CapString.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        // create an array of lower case strings
        
        NSArray *arrayLowerINput = @[@"case", @"motherboard", @"powersupply", @"cpu", @"Gpu"];
        
        // instance of class
        CapString *capTime = [[CapString alloc]init];

       NSArray *capped =  [capTime arrayCapper:arrayLowerINput];
        
        for (NSString *e in capped) {
            NSLog(@"Question 1 answer %@", e);
        }
        
        
        
        
        
        
        
        
    }
    return 0;
}
