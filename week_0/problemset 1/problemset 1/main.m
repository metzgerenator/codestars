//
//  main.m
//  problemset 1
//

//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Question 1
        // Create a mutable array
        NSMutableArray *array = [[NSMutableArray alloc]initWithObjects:@"computer", @"iphone", @"racecar", @"macbook", @"ipad", nil];
        
        // Get a count of array using instance of NSUInteger
        NSUInteger arrayCount = [array count];
        
        // Iterate through array
        for (int x = 0; x < arrayCount; x++) {
            
            // pass uppercaseString method to instance of NSString *d
            NSString *itemInArray = [array[x] uppercaseString];
            
            //set item at index x to instance of String
            array[x] = itemInArray;
            
            //Log output for question 1
            NSLog(@"Question 1 Answer:array at index %d is now %@\n", x, array[x]);
        }
        //End Question 1
        
        //////////////////////
        //Begin Question 2
        
        // create an array of objects
        NSArray *numbers = @[@45, @22090909, @5698, @90433, @43431, @3454115, @43002, @109981, @545, @14345435, @1009282, @90909, @13233, @443535, @14782920, @49304, @434];
        
        
        // Iterate through array
        for (NSNumber* objectInArray in numbers) {
            
            // convert NSNumber object in array to long
            long convertedInt = [objectInArray integerValue];
           
            // if statement using % operator
            if (convertedInt % 2 == 0) {
                NSLog(@"Question 2 answer is  %ld\n", convertedInt);
            }
        }
        //End Question 2
        ///////////////////
        //Begin Question 3
        
        // Create an NSArray
        NSArray *arrayTime =  @[@100, @80, @85, @70, @99, @50, @45, @89, @34, @53, @25, @39];
        
        // Create primitive data type
        int sumOfArray = 0;
        
        // Iterate through the array
        for (NSNumber *numberInArray in arrayTime) {
            // Convert object in array to Int
            int e = [numberInArray intValue];
            // add int d to e
            sumOfArray += e;
            
            
        }
        
        NSLog(@"Question 3 answer is %d", sumOfArray);
        // End Question 3
        
        
    }
    return 0;
}
