//
//  main.m
//  problem_8
//The four adjacent digits in the 1000-digit number that have the greatest product are 9 × 9 × 8 × 9 = 5832.
//Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        //Store 1000 number as a string
        NSString *bignumber = @"7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";
        
        
        //Create an array to store the 1000 numbers into
        NSMutableArray *numberArray = [[NSMutableArray alloc]init];
        //Create
        NSMutableArray *productArray = [[NSMutableArray alloc]init];
        
        //convert a string into an array
        
        for (int x = 0; x < bignumber.length; x ++) {
            NSString *numberInput = [NSString stringWithFormat:@"%c", [bignumber characterAtIndex:x]];
            
            
            //convert each NSString to an NSNumber objec
            NSNumber *numberForArray = [[NSNumber alloc]initWithInt:[numberInput intValue]];
//            NSLog(@"%@", numberForArray);
            //Store the NSNumber object into numberArray
            [numberArray addObject:numberForArray];
            
        }
        
    
        int numberAdder = 1;
        int arrayIndex = 999;
        for (int x = 4; x >= 1; x--) {
        
        
//            NSLog(@"%d", x);
        
        numberAdder = numberAdder * [numberArray[arrayIndex] intValue];
            
            
//            NSLog(@"array Index is %d", arrayIndex);
            
            arrayIndex = arrayIndex -1;
            
            if (x == 1) {
                NSLog(@"number adder is now %d", numberAdder);
                x = 5;
                numberAdder = 1;
            }
           
            if (arrayIndex ==0 ) {
                break;
            }
        
        
        }
        
        
        
        
        
    }
    
    
    
    return 0;
}
