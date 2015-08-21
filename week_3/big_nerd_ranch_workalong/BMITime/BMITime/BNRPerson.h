//
//  BNRPerson.h
//  BMITime
//
//  Created by Michael Metzger  on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject

//BNRPerson has two instance variables
@property (nonatomic) float heightInMeters;
@property (nonatomic) int weightInKilos;


//BNRPerson has a method that calculates the Body Mass Index
-(float)bodyMassIndex;  




@end
