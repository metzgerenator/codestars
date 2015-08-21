//
//  main.m
//  BMITime
//
//  Created by Michael Metzger  on 8/21/15.
//  Copyright (c) 2015 Michael Metzger . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Create an instance of BNRPerson
        BNREmployee *mikey = [[BNREmployee alloc]init];
        
        //Give the instance variables interesting values using setters
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        mikey.employeeID = 12;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd, 2010"];
        
        //Log the instance variables using the getters
        float height = mikey.heightInMeters;
        int weight = mikey.weightInKilos;
        NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", height, weight);
        NSDate *date = mikey.hireDate;
        NSLog(@"%@ hired on %@", mikey, date);   
        NSLog(@"Employee %u hired on %@", mikey.employeeID, mikey.hireDate);
        
        //Log the body mass index using he bodyMassIndex method
        float bmi = [mikey bodyMassIndex];
        double years = [mikey yearsOfEmployement];
        NSLog(@"BMI of %.2f, has worked with us for %.2f years", bmi, years);
        NSLog(@"mikey has BMI of %f", bmi);
        
        
        
    }
    return 0;
}
