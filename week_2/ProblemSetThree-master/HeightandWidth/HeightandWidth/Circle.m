//
//  Circle.m
//  HeightandWidth
//
//

#import "Circle.h"

@implementation Circle

-(NSNumber *) areaCalculator{
    int area = 3.14 * self.radius * self.radius;
    
    return [[NSNumber alloc]initWithInt:area];
    
};



@end
