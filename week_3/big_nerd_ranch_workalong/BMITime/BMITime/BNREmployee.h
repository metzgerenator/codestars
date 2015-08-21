//
//  BNREmployee.h
//  BMITime
//
//  Created by Michael Metzger  on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson


@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSArray *assets;
-(double)yearsOfEmployement;
-(void)addAssets:(BNRAsset *)a;
-(unsigned int) valueOfAssets;  

@end
