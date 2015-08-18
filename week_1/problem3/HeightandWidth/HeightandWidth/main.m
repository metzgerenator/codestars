//
//  main.m
//  HeightandWidth

#import <Foundation/Foundation.h>
#import "Shape.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Shape *areaOne = [[Shape alloc]init];
        
        areaOne.height = @12;
        areaOne.width = @15;
        
        NSLog(@"The answer to question 3 is %@", areaOne.areaCalculator);  
    
        
        
    }
    return 0;
}
