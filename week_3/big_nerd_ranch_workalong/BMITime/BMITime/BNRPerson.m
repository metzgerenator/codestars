//
//  BNRPerson.m
//  BMITime
//
//  Created by Michael Metzger  on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson



-(float)bodyMassIndex
{
//    return _weightInKilos / (_heightINMEters * _heightINMEters);
    
    float h = [self heightInMeters];
    return [self weightInKilos] / (h * h);
}

@end
