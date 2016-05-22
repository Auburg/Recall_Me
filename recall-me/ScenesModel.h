//
//  ScenesModel.h
//  recall-me
//
//  Created by Tanvir Kazi on 12/01/2013.
//  Copyright (c) 2013 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScenesModel : NSObject
{
    @private
    NSMutableArray* _sceneModels;
    int _currentSceneIndex;
}


-(id)initWithSceneFile:(NSString*)file;
-(BOOL)CanGetNextScene;
-(id)GetCurrentScene;
-(id)GetNextScene;

@end
