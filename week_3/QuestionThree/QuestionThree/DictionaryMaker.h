//
//  DictionaryMaker.h
//  QuestionThree
//
//  Created by Aileen Taboy on 8/17/15.
//  Copyright (c) 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DictionaryMaker : NSObject


//Function for creating car Dictionaries

-(NSMutableDictionary *)addModel: (NSString *)model foryear:(NSString*)year formake:(NSString*)make;



// Function for printing out 5 dictionaries
-(void) arrayPrinter: (NSArray *)arrayInput;





@end
