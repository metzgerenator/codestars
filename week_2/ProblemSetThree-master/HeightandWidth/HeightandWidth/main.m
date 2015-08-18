//
//  main.m
//  HeightandWidth

///2) Create a Square class that inherits from the Shape class that you created in Problem Set 2 and calculate the area of that class. The formula to calculate the area of a square is area = width * height.

//3) Create a Circle class that inherits from the Shape class that you created in Problem Set 2 and calculate the area of that class. The formula to calculate the area of a circle is area = 3.14 * radius * radius.

//4) Instantiate a Circle and Square class in main.m and log the area for each to the console.


#import <Foundation/Foundation.h>
#import "Square.h"
#import "Circle.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Square *areaOne = [[Square alloc]init];
        
        areaOne.height = @12;
        areaOne.width = @15;
        
        Circle *circArea = [[Circle alloc]init];
        
        circArea.radius = 20;
     
        
        NSLog(@"The answer to question 3 square class is %@", areaOne.areaCalculator);
        NSLog(@"The answer to question 3 Circle class is %@", circArea.areaCalculator);  
        
        
    
        
        
    }
    return 0;
}
