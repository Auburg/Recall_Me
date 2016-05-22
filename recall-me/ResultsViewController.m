//
//  ResultsViewController.m
//  recall-me
//
//  Created by Tanvir Kazi on 28/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "ResultsViewController.h"
#import "Results.h"

@implementation ResultsViewController
@synthesize lblResults;
@synthesize Results;


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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *str;
    str = [NSString stringWithFormat:@"You got %d correct answers",self.Results.NumCorrect];
    
    lblResults.text = str;
}


- (void)viewDidUnload
{
    [self setLblResults:nil];
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
