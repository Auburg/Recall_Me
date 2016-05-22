//
//  HexagonVC.m
//  recall-me
//
//  Created by Tanvir Kazi on 28/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "HexagonScenePresenterVC.h"
#import "HexagonSceneModel.h"
#import "HexagonAnswerVC.h"

@interface HexagonScenePresenterVC () 

-(void)ShowNext;    

@end


@implementation HexagonScenePresenterVC

@synthesize Difficulty;
@synthesize ScenesModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)ShowNext
{
    [self performSegueWithIdentifier:@"segueHexagonAnswer" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HexagonAnswerVC* hVC = segue.destinationViewController;
    
    NSMutableArray* a = [[NSMutableArray alloc] init];
    
    for (CALayer* ca in self.view.layer.sublayers) {
        
        HexagonLayer* h = (HexagonLayer*)ca;
        
        if (h==nil) {
            continue;
        }
        
        [a addObject:h];
    }
    
    hVC.ScenesModel = self.ScenesModel;
    hVC.Difficulty = self.Difficulty;
    
    [hVC setHexagonLayers:a];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    HexagonSceneModel* hexScene = [self.ScenesModel GetCurrentScene];
    
    if (hexScene==nil) {
        return;
    }
    
    for (HexagonLayerModel* hexModel in hexScene.HexagonModels) {
        
        HexagonLayer* hexagonLayer = [[HexagonLayer alloc]initWithModel:hexModel];
        
        [hexagonLayer setPresentationMode:true];
        
        hexagonLayer.frame = CGRectMake(200, 300, hexModel.Length, hexModel.Length);
        
        hexagonLayer.name = @"hex";
        
        [self.view.layer addSublayer:hexagonLayer];  

    }  
    
    int delay = 4;
    
    if ([self.Difficulty isEqualToString:@"medium"]) {
        delay=2;
    }
        
    if ([self.Difficulty isEqualToString:@"hard"]) {
        delay=1;
    }    
    
    [self performSelector:@selector(ShowNext) withObject:nil afterDelay:delay];
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
