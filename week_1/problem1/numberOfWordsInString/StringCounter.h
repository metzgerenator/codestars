//
//  StringCounter.h
//  numberOfWordsInString
//
//

#import <Foundation/Foundation.h>

@interface StringCounter : NSObject

@property(nonatomic)NSString *stringInput;


// method to seperate string into an array and count words

-(NSUInteger)countOfStringInput;

@end
