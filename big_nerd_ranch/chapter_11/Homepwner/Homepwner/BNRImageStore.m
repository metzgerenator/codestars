//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Aileen Taboy on 11/9/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore ()

@property (nonatomic, strong)NSMutableDictionary *dictionary;



@end


@implementation BNRImageStore

+(instancetype)sharedStore
{
    static BNRImageStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc]initPrivate];
        
    }
    
    return sharedStore;
}


//No one should call init
-(instancetype)init{
    [NSException raise:@"Singleton" format:@"Use + [BNRImageStore sharedStore]"];
    
    return nil;
}

//Secret designated initilizer
-(instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc]init];
    }

    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
  
}


-(UIImage *)imageFOrKey:(NSString *)key{
    
    return self.dictionary[key];
    
}

-(void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
}






@end
