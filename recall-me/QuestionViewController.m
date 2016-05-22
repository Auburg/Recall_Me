//
//  QuestionViewController.m
//  recall-me
//
//  Created by Tanvir Kazi on 27/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "QuestionViewController.h"
#import "PictureViewController.h"

@interface QuestionViewController()

-(void)UpdateQuestion:(Question*)q withIndex:(int)i andMainImageName:(NSString*)n;

@end

@implementation QuestionViewController
@synthesize questionImage;
@synthesize PictureModel;

@synthesize answerText;
@synthesize lblQuestion;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)onOKPressed:(id)sender {
    
    Question* currentQuestion = [PictureModel.CurrentPicture.Questions objectAtIndex:_index];
    
    if ([[answerText text].lowercaseString isEqualToString:currentQuestion.Answer.lowercaseString]) {
        PictureModel.NumCorrectAnswers++;
    }
    
    if (++_index>=[self.PictureModel.CurrentPicture.Questions count]) {
        
        [self performSegueWithIdentifier:@"questionToPictureSegue" sender:self]; 
    }
    else
    {
        Question* q = [PictureModel.CurrentPicture.Questions objectAtIndex:_index];
        [self UpdateQuestion:q withIndex:_index andMainImageName:PictureModel.CurrentPicture.Image];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    PictureViewController* pvc = [segue destinationViewController];
    
    pvc.InvokedFromQuestionVC = true;
    pvc.PictureModel   = PictureModel;
    
    
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
    
    _index = 0;     
    
    Question* q = [PictureModel.CurrentPicture.Questions objectAtIndex:_index];
    
    [self UpdateQuestion:q withIndex:_index+1 andMainImageName:PictureModel.CurrentPicture.Image];
}

-(void)UpdateQuestion:(Question*)q withIndex:(int)i andMainImageName:(NSString*)n
{
    [lblQuestion setText: q.Question];
    
    NSArray *tempArray    = [n componentsSeparatedByString: @"."];
    
    NSString* questionStr = [[tempArray objectAtIndex:0] stringByAppendingFormat:
                               @"_%d.%@", i, [tempArray objectAtIndex:1]];
    
    questionImage.image   = [UIImage imageNamed: questionStr];
}


- (void)viewDidUnload
{
    [self setQuestionImage:nil];
    [self setAnswerText:nil];
    [self setLblQuestion:nil];
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
