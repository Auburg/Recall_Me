//
//  HexagonAnswerVC.m
//  recall-me
//
//  Created by Tanvir Kazi on 31/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "HexagonAnswerVC.h"
#import "HexagonLayer.h"
#import "HexagonLayerModel.h"
#import "ResultsViewController.h"
#import "AnimationVC.h"
#import "Protocol.h"

@implementation HexagonAnswerVC

@synthesize ScenesModel;
@synthesize Difficulty;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {       
        
        // Custom initialization
        //self.HexagonLayers = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void)setHexagonLayers:(NSMutableArray*)hexLayers
{
    if (_hexagonLayers!=nil) {
        _hexagonLayers = nil;
    } 
    
    _hexagonLayers = [[NSMutableArray alloc]initWithArray:hexLayers];
    
    _results = [[Results alloc]init];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    //_touchesLayer = nil;
    
    if ([touches count] == 1) {
        for (UITouch *touch in touches) {
            
            CGPoint location = [touch locationInView:self.view];
            CALayer *layer = self.view.layer;
            location = [layer.superlayer convertPoint:location fromLayer:layer];
            CALayer* layerThatWasTapped = [layer hitTest:location];
            
            if ( [layerThatWasTapped conformsToProtocol: @protocol( HandleTouch )] == YES ) {
                
                id <HandleTouch> handleTouch = layerThatWasTapped;
                
                [handleTouch HandleTouch];
            }
        }
    }
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
    
    for (HexagonLayer* h in _hexagonLayers) {
        
        [h setPresentationMode:false];
        
        h.frame = CGRectMake(200, 300, h.bounds.size.width,h.bounds.size.height);
        
        [self.view.layer addSublayer:h];        
    }
    
    _hexagonLayers = nil;
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

- (IBAction)OnNext:(id)sender {
    
    _results.NumCorrect = 0;
    
    for (CALayer* cl in self.view.layer.sublayers) {
        
        if ( [cl conformsToProtocol: @protocol( Verifiable )] == YES ) {
            
            id <Verifiable> verify = cl;
            
            bool ret = [verify IsCorrect];
            
            if (ret) {
                
                _results.NumCorrect++;
                
            }
        }
    }
    
    if (self.ScenesModel!=nil) {
        
        if ([self.ScenesModel CanGetNextScene]) {
            [self performSegueWithIdentifier:@"segueToAnimationVC" sender:self];
            
            return;
        }
    }
    
    
    [self performSegueWithIdentifier:@"segueResults" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{
    if ([segue.identifier isEqualToString:@"segueResults" ]) {
        
        ResultsViewController* r = segue.destinationViewController;
        
        r.Results = _results;
    }
    else if([segue.identifier isEqualToString:@"segueToAnimationVC" ]) {
        
        AnimationVC* a = segue.destinationViewController;
        
        a.ScenesModel = self.ScenesModel;
        a.CalledFromScenesVC = true;
        a.Difficulty = self.Difficulty;
        
    }
}

@end
