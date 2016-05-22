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
#import "HexagonLayerModel.h"
#import "SegmentData.h"
#import "ScenesModel.h"


@interface HexagonScenePresenterVC : UIViewController
{
    UISwipeGestureRecognizer* _swipeGestureRecognizer; 
   
}

@property (weak,nonatomic) NSString* Difficulty;
@property (retain,nonatomic) ScenesModel* ScenesModel;

@end
