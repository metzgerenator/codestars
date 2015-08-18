//
//  Shape.m
//  HeightandWidth


#import "Shape.h"

@implementation Shape
-(NSNumber *) areaCalculator{
    
    int height = [self.height intValue];
    int width = [self.width intValue];
    
    int areaCalc = height * width;
    
    NSNumber *area = [[NSNumber alloc]initWithInt:areaCalc];
    
    return area; 
    
}

@end
