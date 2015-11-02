//
//  BNRHyponsisView.m
//  Hyponsister
//
//

#import "BNRHyponsisView.h"

@implementation BNRHyponsisView


//Had to add this code to init frame
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGRect bounds = self.bounds;
    
    //Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
//    //The circle will be the largest that will fit in the view
//    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;
    
    //The largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    

    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x +currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius // Note this is currentRaidus!
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    //Configure line width to 10 points
    path.lineWidth = 10;
    
    //Configure the drawing color to light gray
    [[UIColor lightGrayColor]setStroke];
    
    
    //Draw the line!
    [path stroke];
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect size = CGRectMake(20, 30, 50, 50);
    CGRect firstFrame = self.window.bounds;

    
    [logoImage drawInRect:size];
    [logoImage drawInRect:firstFrame];
    
    
}


@end
