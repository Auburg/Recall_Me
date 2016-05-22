//
//  HexagonLayerModel.h
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 25/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "SegmentData.h"

@interface HexagonLayerModel : NSObject

-(id)initWithSegmentData:(NSArray*)segmentData length:(int)l;


@property (nonatomic) int Length;
@property (nonatomic,retain) NSArray* SegmentData;

@end
