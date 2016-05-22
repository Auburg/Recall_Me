//
//  Protocol.h
//  recall-me
//
//  Created by Tanvir Kazi on 28/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HandleTouch <NSObject>

-(void)HandleTouch;

@end

@protocol Verifiable <NSObject>

-(BOOL)IsCorrect;

@end