//
//  ArrayCombo.h
//  Question2
//
// Write a function that takes two NSArrays as arguments and returns another NSArray that is the combination of the two arrays. For example, if I pass the following arrays @[@1, @2, @3] and @[@4, @5, @6] it will return @[@1, @2, @3, @4, @5, @6].
//

#import <Foundation/Foundation.h>

@interface ArrayCombo : NSObject



-(NSArray*)arrayCombinator:(NSArray*)arrayOne inputTwo:(NSArray*)arrayTwo;


@end
