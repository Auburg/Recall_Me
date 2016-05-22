//
//  HexagonLayer.m
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 23/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "HexagonLayer.h"
#import "TriangleLayer.h"

const int NumTriangles = 6; 

@interface HexagonLayer()

-(void)InitShapes:(HexagonLayerModel*)m;

@end

@implementation HexagonLayer

-(id)initWithModel:(HexagonLayerModel*)m {
    
    self = [super init];
    
    if (self) 
    {
        [self InitShapes:m];        
        
    }
    
    return self;
}

-(void)setPresentationMode:(bool)p
{
    for (CALayer* calayer in self.sublayers) {
        
        TriangleLayer* t = (TriangleLayer*)calayer;
        
        if (t==nil) {
            continue;
        }
        
        [t SetPresentationMode:p];
    }
}

-(void)InitShapes:(HexagonLayerModel*)m
{
    TriangleLayer* triangles[m.Length];  
    
    NSAssert(m.SegmentData.count ==NumTriangles , @"invalid number of segment data");
    
    
    for (int i=0; i<NumTriangles; i++) {
        
        triangles[i] = [[TriangleLayer alloc]initWithSegment:[m.SegmentData objectAtIndex:i] length:m.Length];  
        
        triangles[i].bounds = CGRectMake(0, 0, m.Length, m.Length);         
        
                 
    }    
    
    [triangles[1] setAffineTransform:CGAffineTransformScale(CGAffineTransformMakeTranslation(m.Length/2, 0), 1, -1) ];
    
    [triangles[2] setAffineTransform:CGAffineTransformMakeTranslation(m.Length, 0)];
    
    
    [triangles[2] setAffineTransform:CGAffineTransformScale(CGAffineTransformMakeTranslation(m.Length,0), 1, 1) ];
    
    [triangles[3] setAffineTransform:CGAffineTransformScale(CGAffineTransformMakeTranslation(0,m.Length), 1, -1) ];
    
    [triangles[4] setAffineTransform:CGAffineTransformMakeTranslation(m.Length/2, m.Length) ];
    
    [triangles[5] setAffineTransform:CGAffineTransformScale(CGAffineTransformMakeTranslation(m.Length,m.Length), 1, -1) ];
    
    for (int i=0; i<NumTriangles; i++) {        
    
        [self addSublayer:triangles[i]];
    } 
    
}

-(BOOL)IsCorrect
{
    bool ret = true;
    
    for (CALayer* calayer in self.sublayers) {
        
        TriangleLayer* t = (TriangleLayer*)calayer;
        
        if (t==nil) {
            continue;
        }
        
        ret = [t IsCorrect];
        
        if (!ret) {
            break;
        }
    }
    
    return ret;
}

@end
