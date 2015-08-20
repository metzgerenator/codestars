//
//  DictionaryMaker.h
//  QuestionThree
//
//

#import <Foundation/Foundation.h>

@interface DictionaryMaker : NSObject


//Function for creating car Dictionaries

-(NSMutableDictionary *)addModel: (NSString *)model foryear:(NSString*)year formake:(NSString*)make;



// Function for printing out 5 dictionaries
-(void) arrayPrinter: (NSArray *)arrayInput;





@end
