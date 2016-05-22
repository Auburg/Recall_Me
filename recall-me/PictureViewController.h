//
//  PictureViewController.h
//  recall-me
//
//  Created by Tanvir Kazi on 22/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PicturesModel.h"

@interface PictureViewController : UIViewController
{
@private

Picture* _currentPicture;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) PicturesModel* PictureModel;
@property (nonatomic) BOOL InvokedFromQuestionVC;
@property (weak,nonatomic) NSString* Difficulty;


@end
