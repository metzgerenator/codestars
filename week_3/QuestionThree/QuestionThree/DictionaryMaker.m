//
//  DictionaryMaker.m
//  QuestionThree

//

#import "DictionaryMaker.h"

@implementation DictionaryMaker

-(NSMutableDictionary *)addModel:(NSString *)model foryear:(NSString *)year formake:(NSString *)make {
    
    NSMutableDictionary *cars = [[NSMutableDictionary alloc]init];
    
    
    [cars setObject:model forKey:@"model"];
    [cars setObject:year forKey:@"year"];
    [cars setObject:make forKey:@"make"];
    
    
    //  maybe make into an array of objects?   
    
    return cars;
}


-(void) arrayPrinter: (NSArray *)arrayInput{
    
    for (NSDictionary *carModels in arrayInput) {
        NSLog(@"The answer to question 3 is model = %@ year = %@ make = %@\n",[carModels objectForKey:@"model"],[carModels objectForKey:@"year"],[carModels objectForKey:@"make"]);
    }
    
    
}





@end
