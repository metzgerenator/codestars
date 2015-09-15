//
//  Recipe.h
//  CustomTable
//
//  Created by Michael Metzger  on 9/15/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *name; //name of recipe
@property (nonatomic, strong) NSString *preptime; //preparation time
@property (nonatomic, strong) NSString *image; // image filename of recipe


@end
