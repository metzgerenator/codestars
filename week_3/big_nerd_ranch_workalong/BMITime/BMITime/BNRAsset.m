//
//  BNRAsset.m
//  BMITime
//
//  Created by Aileen Taboy on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

-(NSString *) description
{
    return [NSString stringWithFormat:@"<%@: $%U>", self.label, self.resaleValue];
}


-(void) dealloc
{
    NSLog(@"deallocating %@", self);
}
@end
