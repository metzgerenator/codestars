//
//  BNRAsset.m
//  BMITime
//
//  Created by Aileen Taboy on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset

-(NSString *) description
{
//    return [NSString stringWithFormat:@"<%@: $%U>", self.label, self.resaleValue];
    
    
    //is the holder non-nill/
    if (self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@", self.label, self.resaleValue, self.holder];
    }else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>", self.label,self.resaleValue];   
    }

}


-(void) dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
