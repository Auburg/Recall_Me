//
//  ResultsViewController.h
//  recall-me
//
//  Created by Tanvir Kazi on 28/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Results.h"

@interface ResultsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblResults;



@property (retain,nonatomic) Results* Results;


@end
