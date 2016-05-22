//
//  PicturesModel.h
//  Recall
//
//  Created by Tanvir Kazi on 24/03/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Picture.h"

@interface PicturesModel : NSObject
{
@private
    NSMutableArray* _pictures;
    int _currentPictureIndex;
    Picture* _currentPict;
}

-(void)Reset;
-(BOOL)CanSetNextPicture;
-(void)SetNextPicture;
-(int)NumPictures;

@property (nonatomic, retain) Picture*CurrentPicture;
@property (nonatomic) int NumCorrectAnswers;

@end
