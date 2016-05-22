//
//  TriangleLayer.h
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 23/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#include "Protocol.h"
#include "SegmentData.h"

@interface TriangleLayer : CAShapeLayer <HandleTouch,Verifiable>

@property (nonatomic,retain) SegmentData* Segment;  


- (id)initWithSegment:(SegmentData*)s length:(int)l;
-(void)SetPresentationMode:(bool)p;

@end
