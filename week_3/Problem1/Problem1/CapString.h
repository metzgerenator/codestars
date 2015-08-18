//
//  CapString.h
//  Problem1
//1) Write a function that takes an NSSArray of strings as an argument and returns a new NSArray of the same strings capitalized. For example, if I were to pass the following array @[@"cat", @"dog", @"frog"] it would return @[@"CAT", @"DOG", @"FROG"].

//

#import <Foundation/Foundation.h>

@interface CapString : NSObject


-(NSArray *) arrayCapper: (NSArray*)lowerCaseInput;



@end
