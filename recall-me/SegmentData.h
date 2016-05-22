//
//  SegmentData.h
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 26/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface SegmentData : NSObject

-(id)initWithColor:(NSArray*)colors colourIndex:(int)ci targetColourIndex:(int)ti;

@property (nonatomic) int OrigColorIndex;

@property (nonatomic) int CurrentColorIndex;

@property (nonatomic) int TargetColorIndex;

@property (nonatomic,retain) NSArray* ColorTable;

@end
