//
//  CapString.m
//  Problem1
//
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
