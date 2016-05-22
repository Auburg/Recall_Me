//
//  HexagonAnswerVC.h
//  recall-me
//
//  Created by Tanvir Kazi on 31/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Results.h"
#import "ScenesModel.h"

@interface HexagonAnswerVC : UIViewController
{
    NSMutableArray* _hexagonLayers;
    Results* _results;
}

@property(strong,nonatomic)ScenesModel* ScenesModel;
@property(retain,nonatomic)NSString* Difficulty;

-(void)setHexagonLayers:(NSMutableArray*)hexLayers; 



- (IBAction)OnNext:(id)sender;

@end
