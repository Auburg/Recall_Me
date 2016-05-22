//
//  HexagonVC.h
//  recall-me
//
//  Created by Tanvir Kazi on 28/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TriangleLayer.h"
#import "HexagonLayer.h"
#import "Protocol.h"
#import "HexagonLayerModel.h"
#import "SegmentData.h"


@interface HexagonVC : UIViewController
{
    UISwipeGestureRecognizer* _swipeGestureRecognizer; 
    UIView* _hexagonView;
}



@end
