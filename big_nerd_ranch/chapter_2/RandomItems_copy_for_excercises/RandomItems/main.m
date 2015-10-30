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
      
        for (int i = 0; i <10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
       
        
        //For every itme in the items array
        for (BNRItem *item in items) {
            //Log the description of the item
            NSLog(@"%@", item);
        }
        
        
        // Destroy the mutable array object
        items = nil;
        
        
        BNRItem *practiceItem = [[BNRItem alloc]initWithItemName:@"coolItem" serialNumber:@"abcde"];
        
        NSLog(@"practice Item is %@", practiceItem);
        
        BNRItem *practiceTwo = [[BNRItem alloc]initWithItemName:@"hello"];
        NSLog(@"practice two is %@", practiceTwo);
        
    }
    return 0;
}
