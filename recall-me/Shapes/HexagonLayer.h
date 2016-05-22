//
//  HexagonLayer.h
//  AnimLayersTest
//
//  Created by Tanvir Kazi on 23/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "Protocol.h"
#import "HexagonLayerModel.h"


@interface HexagonLayer : CALayer <Verifiable>

-(id)initWithModel:(HexagonLayerModel*)m;
-(void)setPresentationMode:(bool)p;

@end
