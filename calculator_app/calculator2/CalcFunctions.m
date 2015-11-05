//
//  CalcFunctions.m
//  calculator2
//
//  Created by Michael Metzger  on 11/4/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "CalcFunctions.h"

@implementation CalcFunctions

-(NSNumber *)addition: (double)numberInputOne
         secondDouble:(double)numberInputTwo{
    
    double forInput = numberInputOne + numberInputTwo;
    
    NSNumber *converted = [[NSNumber alloc]initWithDouble:forInput];
    
    return converted;
}


-(NSNumber *)subtraction: (double)numberInputOne
            secondDouble:(double)numberInputTwo{
    
    double forInput = numberInputOne - numberInputTwo;
    
    NSNumber *converted = [[NSNumber alloc]initWithDouble:forInput];
    
    return converted;
    
    
}

-(NSNumber *)multiplication: (double)numberInputOne
               secondDouble:(double)numberInputTwo{
    double forInput = numberInputOne * numberInputTwo;
    
    NSNumber *converted = [[NSNumber alloc]initWithDouble:forInput];
    
    return converted;
}

-(NSNumber *)division: (double)numberInputOne
         secondDouble:(double)numberInputTwo{
    
    double forInput = numberInputOne / numberInputTwo;
    
    NSNumber *converted = [[NSNumber alloc]initWithDouble:forInput];
    
    return converted;
}





@end
