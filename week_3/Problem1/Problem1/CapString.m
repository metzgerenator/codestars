//
//  CapString.m
//  Problem1
//
//  Created by Michael Metzger  on 8/17/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import "CapString.h"

@implementation CapString

-(NSArray *) arrayCapper: (NSArray*)lowerCaseInput{
    
    NSMutableArray *upperCase = [[NSMutableArray alloc]init];

    for (NSString *d in lowerCaseInput) {
        
        NSString *capInput = [d uppercaseString];
        
        [upperCase addObject:capInput];
    }
    
    
    return upperCase;
    
}









@end
