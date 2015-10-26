//
//  main.m
//  problem_8
//The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
//Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
//

#import <Foundation/Foundation.h>
#import "ArraySorting.h" 
#import "ArrayDecrease.h"
#import "ArrayIncrease.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
        
        
        //Store 1000 number as a string
        NSString *bignumber = @"7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";
        
        
        //Create an array to store the 1000 numbers into
        NSMutableArray *numberArray = [[NSMutableArray alloc]init];
        
        //2nd array for other iteration
        
        NSMutableArray *numberArray2 = [[NSMutableArray alloc]init];
        
        
        //final array to store all the products
        NSMutableArray *finalProductArray = [[NSMutableArray alloc]init];
        
        //convert a string into an array
        
        for (int x = 0; x < bignumber.length; x ++) {
            NSString *numberInput = [NSString stringWithFormat:@"%c", [bignumber characterAtIndex:x]];
            
            
            //convert each NSString to an NSNumber objec
            NSNumber *numberForArray = [[NSNumber alloc]initWithInt:[numberInput intValue]];
            
            //Store the NSNumber object into numberArray
            [numberArray addObject:numberForArray];
            
            [numberArray2 addObject:numberForArray];
            
        }
        
        
        
        
        // Descend through Array
        
        ArrayDecrease *arrayDecreaseInstance = [[ArrayDecrease alloc]init];
       NSArray *arrayDecreased = [arrayDecreaseInstance decreaseArray:numberArray];
        
        for (NSNumber *numberInput1 in arrayDecreased) {
            [finalProductArray addObject:numberInput1];
        }
        
        // Ascend through Array
        
        ArrayIncrease *arrayIncreasedInstance = [[ArrayIncrease alloc]init];
        NSArray *arrayIncreased = [arrayIncreasedInstance arryIncreaeSorter:numberArray2];
        
        for (NSNumber *numberInput2 in arrayIncreased) {
            [finalProductArray addObject:numberInput2];
        }
        //Combine the array's into product array
        
     
        
        
        
        
        // sort the product array
        ArraySorting *sortedArray = [[ArraySorting alloc]init];
       NSArray *finalArray = [sortedArray arraysorter:finalProductArray];
        
        
        // Find the largest sorted number
        unsigned long finalNumerIndex = finalArray.count -1;
        
        NSNumber *finalNumber = [finalArray objectAtIndex:finalNumerIndex];
        
        NSLog(@"final number is %@", finalNumber);
        
        
    }
    

  






    return 0;
}
