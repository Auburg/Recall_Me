//
//  SegmentData.m
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 26/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "SegmentData.h"

@implementation SegmentData

@synthesize CurrentColorIndex;
@synthesize OrigColorIndex;
@synthesize TargetColorIndex;
@synthesize ColorTable;

-(id)initWithColor:(NSArray*)colors colourIndex:(int)ci targetColourIndex:(int)ti
{
    if ( self = [super init] ) {
        self.CurrentColorIndex = ci;       
        self.TargetColorIndex = ti;
        self.OrigColorIndex = ci;
        self.ColorTable = colors;
    }
    return self; 
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"Current index %d Target index %d Orig Index %d",self.CurrentColorIndex,self.TargetColorIndex,self.OrigColorIndex];
}

@end
