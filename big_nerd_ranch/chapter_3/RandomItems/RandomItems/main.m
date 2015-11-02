//
//  main.m
//  RandomItems
//

//  Copyright © 2015 Mike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *items = [[NSMutableArray alloc]init];
      
        BNRItem *backpack = [[BNRItem alloc]initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator = [[BNRItem alloc]initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
       
        
        //For every itme in the items array
        for (BNRItem *item in items) {
            //Log the description of the item
            NSLog(@"%@", item);
        }
        
        
        // Destroy the mutable array object
        NSLog(@"Setting items to nil...");
        items = nil;
        
        
        
        
        
        
    }
    return 0;
}
