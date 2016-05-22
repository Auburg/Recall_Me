//
//  QuestionViewController.h
//  recall-me
//
//  Created by Tanvir Kazi on 27/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicturesModel.h"

@interface QuestionViewController : UIViewController
{
@private
    
    int _index;
    
    
}

@property (weak, nonatomic) IBOutlet UIImageView *questionImage;

@property (weak, nonatomic) IBOutlet UITextField *answerText;

@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;

@property (weak,nonatomic) PicturesModel* PictureModel;


@end
