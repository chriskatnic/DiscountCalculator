

#import "Custom_UI_View.h"

@implementation Custom_UI_View


- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        self.opaque = YES;
        self.clearsContextBeforeDrawing = YES;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
            // Drawing with a white stroke color
            CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
            // And drawing with a blue fill color
            CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
            // Draw them with a 2.0 stroke width so they are a bit more visible.
            CGContextSetLineWidth(context, 2.0);
            
            // Add Rect to the current path, then stroke it
            CGContextAddRect(context, CGRectMake(30.0, 30.0, 60.0, 60.0));
            CGContextStrokePath(context);
            
            // Stroke Rect convenience that is equivalent to above
            CGContextStrokeRect(context, CGRectMake(30.0, 120.0, 60.0, 60.0));
            
            // Stroke rect convenience equivalent to the above, plus a call to CGContextSetLineWidth().
            CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 210.0, 60.0, 60.0), 10.0);
            // Demonstate the stroke is on both sides of the path.
            CGContextSaveGState(context);
            CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
            CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 210.0, 60.0, 60.0), 2.0);
            CGContextRestoreGState(context);
            
            CGRect rects[] =
        {
            CGRectMake(120.0, 30.0, 60.0, 60.0),
            CGRectMake(120.0, 120.0, 60.0, 60.0),
            CGRectMake(120.0, 210.0, 60.0, 60.0),
        };
            // Bulk call to add rects to the current path.
            CGContextAddRects(context, rects, sizeof(rects)/sizeof(rects[0]));
            CGContextStrokePath(context);
            
            // Create filled rectangles via two different paths.
            // Add/Fill path
            CGContextAddRect(context, CGRectMake(210.0, 30.0, 60.0, 60.0));
            CGContextFillPath(context);
            // Fill convienience.
            CGContextFillRect(context, CGRectMake(210.0, 120.0, 60.0, 60.0));
    
}




@end
