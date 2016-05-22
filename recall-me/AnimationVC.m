//
//  AnimationMenuVC.m
//  recall-me
//
//  Created by Tanvir Kazi on 05/11/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "AnimationVC.h"
#import "HexagonScenePresenterVC.h"
#import "HexagonSceneModel.h"

@implementation AnimationVC

@synthesize Difficulty;
@synthesize ScenesModel;
@synthesize CalledFromScenesVC;

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidAppear:(BOOL)animated    
{
    [super viewDidAppear:animated];
    
    id scene = nil;
    
    if (self.CalledFromScenesVC) {
        self.CalledFromScenesVC = false;
        
        if (self.ScenesModel==nil) {
            
            return;
            
        }
        
        if ([self.ScenesModel CanGetNextScene]) {
            scene = [self.ScenesModel GetNextScene];
        }
        
    }
    else
    {
       self.ScenesModel = [[ScenesModel alloc]initWithSceneFile:@"ShapeScenes1.xml"];  
       scene = [self.ScenesModel GetCurrentScene]; 
        
    } 
    
    if ([scene isKindOfClass:[HexagonSceneModel class]]) {
        
       [self performSegueWithIdentifier:@"segueHexagon" sender:self];         
    } 

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([segue.identifier isEqualToString:@"segueHexagon"]) {
        HexagonScenePresenterVC* pVC = segue.destinationViewController;
        pVC.Difficulty = self.Difficulty;  
        pVC.ScenesModel = self.ScenesModel;        
    }    
}


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

@end
