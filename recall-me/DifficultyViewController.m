//
//  DifficultyViewController.m
//  recall-me
//
//  Created by Tanvir Kazi on 03/11/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "DifficultyViewController.h"
#import "PictureViewController.h"
#import "AnimationVC.h"
  

@interface DifficultyViewController ()  

-(void)DoSegue;   
    

@end

@implementation DifficultyViewController

@synthesize callingVC;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}
#pragma end

#pragma mark - logic
-(void)DoSegue
{
    if ([self.callingVC isEqualToString:@"segueAnimation"]) {
        
        [self performSegueWithIdentifier:@"animationSegue" sender:self];
    }
    else
    {
        [self performSegueWithIdentifier:@"pictureSegue" sender:self];     
    }
         
}

- (IBAction)onEasy:(id)sender {
    _menuAction = @"easy";
    [self DoSegue];
}

- (IBAction)onMedium:(id)sender {
    
    _menuAction = @"medium";
    [self DoSegue];
}

- (IBAction)onHard:(id)sender {
    
   _menuAction = @"hard"; 
   [self DoSegue];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([segue.identifier isEqualToString:@"pictureSegue"]) {
        PictureViewController* pVC = segue.destinationViewController;
        pVC.Difficulty = _menuAction;        
        
    }
    else
    {
        AnimationVC* aVC = segue.destinationViewController;
        aVC.Difficulty = _menuAction;
    }
}

#pragma end

@end
