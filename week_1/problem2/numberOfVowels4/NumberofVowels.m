//
//  NumberofVowels.m
//  numberOfVowels4
//

#import "NumberofVowels.h"

@implementation NumberofVowels

-(NSUInteger) stringComparison{
    
    
    //Mutable array to put string components into
    NSMutableArray *stringInputArray = [[NSMutableArray alloc]init];
    
    
    // Make String into an Array
    
    for (int x = 0; x < [self.stringInput length]; x++) {
        //Seperate out stringInput one char at a time
        NSString *oneChar = [NSString stringWithFormat: @"%c", [self.stringInput characterAtIndex:x]];
  
        // add char into stringInputArray
        [stringInputArray addObject:oneChar];
        NSLog(@"adding %@, to index %d", oneChar, x);
        
    }
    
   
    
    //NSCharacterSet for rangeSearch
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:self.vowels];
    
    // number variable to keep track of vowels
     long numberOfVowels = 0;
    
    //Iterate through stringInputArray
    for (NSString *n in stringInputArray) {
        
        //Found this in chapter 17
        NSRange k = [n rangeOfCharacterFromSet:vowelSet options:NSCaseInsensitiveSearch];

        //if k is located in enum, then asign number to number
        if (k.location != NSNotFound) {
            
             long number = k.length;
            
            //add number to numberOfVowels
            numberOfVowels += number;  
            
            // log number of vowels in current iteration 
            NSLog(@"number of vowels!! %lu", number);
            NSLog(@"found one %@",n);
            
        }

    
}
    
    return numberOfVowels;  
}

@end
