//
//  DifficultyViewController.h
//  recall-me
//
//  Created by Tanvir Kazi on 03/11/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DifficultyViewController : UIViewController
{
    @private
    NSString* _menuAction;

    
}

@property (weak, nonatomic)  NSString *callingVC;


- (IBAction)onEasy:(id)sender;

- (IBAction)onMedium:(id)sender;

- (IBAction)onHard:(id)sender;




@end
