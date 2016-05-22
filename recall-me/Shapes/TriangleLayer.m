//
//  TriangleLayer.m
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 23/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "TriangleLayer.h"

@interface TriangleLayer()

-(void)InitPath:(int)length;
-(void)AssignColor;

@end

@implementation TriangleLayer

@synthesize Segment;

- (id)initWithSegment:(SegmentData*)s length:(int)l {
    
    self = [super init];
    
    if (self) 
    {
        self.Segment = s;
        self.Segment.ColorTable = s.ColorTable;
        [self InitPath:l]; 
        
        [self AssignColor];        
        self.strokeColor    = [UIColor yellowColor].CGColor; 
        self.lineWidth      = 1;
    }
    
    return self;
}

-(void)SetPresentationMode:(bool)p
{
    if (self.Segment.OrigColorIndex==-1) {
        
        self.Segment.CurrentColorIndex=p?self.Segment.TargetColorIndex:-1;               
        [self AssignColor];
    }   
}
         
-(void)AssignColor
{
    if (self.Segment.CurrentColorIndex==-1) {
        
        self.fillColor = [UIColor clearColor].CGColor;
        
    }
    else
    {
        UIColor* color = [self.Segment.ColorTable objectAtIndex:self.Segment.CurrentColorIndex];
    
        self.fillColor = color.CGColor;
    }
    
    
    [self setNeedsDisplay];
}
         
         

-(void)InitPath:(int)length
{
    CGMutablePathRef path   = CGPathCreateMutable();    
    CGPoint points[3];
    
    points[0] = CGPointMake(self.bounds.origin.x+length/2, 0); //start
    points[1] = CGPointMake(points[0].x-(length/2),points[0].y+length); //side
    points[2] = CGPointMake(points[1].x+length,points[1].y);
    
    CGPathAddLines(path, NULL,points, sizeof(points)/sizeof(points[0]));
    
    self.path               = path; 
    
    
    CGPathRelease(path);
}

- (BOOL)containsPoint:(CGPoint)p
{
    return CGPathContainsPoint(self.path, NULL, p, false);
}

-(void)HandleTouch
{
    if (self.Segment.OrigColorIndex==-1) {
        
        self.Segment.CurrentColorIndex++;
        
        if (self.Segment.CurrentColorIndex>=self.Segment.ColorTable.count) {
            self.Segment.CurrentColorIndex=0;
        }
        
        [self AssignColor];
        
    }   
    
}

-(BOOL)IsCorrect
{
    return self.Segment.CurrentColorIndex==self.Segment.TargetColorIndex;
}

@end
