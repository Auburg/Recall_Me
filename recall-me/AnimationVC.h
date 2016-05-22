//
//  AnimationMenuVC.h
//  recall-me
//
//  Created by Tanvir Kazi on 05/11/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScenesModel.h"

@interface AnimationVC : UIViewController

@property (weak,nonatomic) NSString* Difficulty;

@property (retain,nonatomic) ScenesModel* ScenesModel;

@property (nonatomic) bool CalledFromScenesVC;

@end
