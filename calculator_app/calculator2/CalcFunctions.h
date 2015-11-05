//
//  CalcFunctions.h
//  calculator2
//
//  Created by Michael Metzger  on 11/4/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcFunctions : NSObject

-(NSNumber *)addition: (double)numberInputOne
         secondDouble:(double)numberInputTwo;


-(NSNumber *)subtraction: (double)numberInputOne
         secondDouble:(double)numberInputTwo;

-(NSNumber *)multiplication: (double)numberInputOne
         secondDouble:(double)numberInputTwo;

-(NSNumber *)division: (double)numberInputOne
         secondDouble:(double)numberInputTwo;


@end
