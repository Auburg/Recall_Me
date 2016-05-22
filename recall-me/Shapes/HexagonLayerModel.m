//
//  HexagonLayerModel.m
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 25/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "HexagonLayerModel.h"

@implementation HexagonLayerModel

@synthesize Length;
@synthesize SegmentData;


-(id)initWithSegmentData:(NSArray*)segmentData length:(int)l;
{
    if ( self = [super init] ) {
        self.SegmentData = segmentData;       
        self.Length = l;
    }
    return self;    
}

@end
