//
//  PictureViewController.m
//  recall-me
//
//  Created by Tanvir Kazi on 22/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "PictureViewController.h"
#import "QuestionViewController.h"
#import "ResultsViewController.h"

@interface PictureViewController()

-(void)ShowNext;
-(void)UpdateWithNewPicture;

@end


@implementation PictureViewController
@synthesize imageView;
@synthesize InvokedFromQuestionVC;
@synthesize PictureModel;
@synthesize Difficulty;

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

-(void)viewDidAppear:(BOOL)animated
{
    if (self.InvokedFromQuestionVC) 
    {
        self.InvokedFromQuestionVC = false;
        
        if ([PictureModel CanSetNextPicture]) {
            
            [PictureModel SetNextPicture];
            
            [self UpdateWithNewPicture];
            
        }
        else
        {
            
            [self performSegueWithIdentifier:@"resultsSegue" sender:self];
//            rvc = [[ResultsViewController alloc]initWithNumberCorrectAnswers:viewController.NumCorrectAnswers from:[_picturesModel NumPictures]];
//            
//            rvc.delegate = self;
//            
//            [self.view addSubview:rvc.view];
        }

    }
    else
    {    
        [PictureModel Reset];
    
        [self UpdateWithNewPicture];
    }
}


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
    
    if (!self.InvokedFromQuestionVC) 
    {
       PictureModel = [[PicturesModel alloc]init]; 
    }
}


- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark 
#pragma mark private methods


-(void)ShowNext
{
    [self performSegueWithIdentifier:@"questionSegue" sender:self]; 
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([segue.identifier isEqualToString:@"resultsSegue"]) 
    {
        ResultsViewController* rvc = [segue destinationViewController];
        Results* r = [[Results alloc]init];
        
        r.NumCorrect = PictureModel.NumCorrectAnswers;
        r.Total = PictureModel.NumPictures;
        
        rvc.Results = r;
        
    }
    else
    {
        QuestionViewController* qvc = [segue destinationViewController];
        
        qvc.PictureModel = PictureModel;
    }    
}

//-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    [super performSegueWithIdentifier:identifier sender:sender];
//    
//    
//}

-(void)UpdateWithNewPicture
{
    _currentPicture = PictureModel.CurrentPicture;    
    
    imageView.image = [UIImage imageNamed: _currentPicture.Image];
    
    [self performSelector:@selector(ShowNext) withObject:nil afterDelay:3];
}

@end
