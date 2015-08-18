//
//  main.m
//  QuestionThree
//
//  3) Write a function that takes an NSArray of five NSDictionaries representing cars and prints out the value stored in each key. Your NSDictionary objects should include "make", "year" and "model" keys. Your function should take your array of dictionaries as an argument and log each model, make and year to the console. For example, if I have the following NSDictionary @{@"make": @"BMW", @"model": @"M6", @"year": @2015} your program should print "2015 BMW M6."
//

#import <Foundation/Foundation.h>
#import "DictionaryMaker.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DictionaryMaker *cars = [[DictionaryMaker alloc]init];
        
        
        
        
       NSMutableDictionary *carInput1 = [cars addModel:@"P85" foryear:@"2015" formake:@"Tesla"];
       NSMutableDictionary *carInput2 = [cars addModel:@"Leaf" foryear:@"2015" formake:@"Nissan"];
       NSMutableDictionary *carInput3 = [cars addModel:@"volt" foryear:@"2014" formake:@"Chevy"];
       NSMutableDictionary *carInput4 = [cars addModel:@"e-golf" foryear:@"2015" formake:@"Volkswagon"];
       NSMutableDictionary *carInput5 = [cars addModel:@"e-300" foryear:@"2014" formake:@"Fiat"];
        
        NSArray *carArray = @[carInput1, carInput2, carInput3, carInput4, carInput5];
        
        [cars arrayPrinter:carArray];
        
        
        
        
        
        
        
       
        
    }
    return 0;
}
