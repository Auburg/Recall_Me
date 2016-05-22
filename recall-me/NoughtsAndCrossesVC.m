//
//  AnimationViewController.m
//  recall-me
//
//  Created by Tanvir Kazi on 28/10/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "NoughtsAndCrossesVC.h"
#import <QuartzCore/QuartzCore.h>

@implementation NoughtsAndCrossesVC

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
    
//    self.view.layer.backgroundColor = [UIColor orangeColor].CGColor;
//    self.view.layer.cornerRadius = 20.0;
//    self.view.layer.frame = CGRectInset(self.view.layer.frame, 20, 20);
    
    CALayer *customDrawn = [CALayer layer];
    customDrawn.delegate = self;
    //customDrawn.backgroundColor = [UIColor greenColor].CGColor;
    customDrawn.frame = CGRectMake(0, 0, self.view.layer.bounds.size.width, self.view.layer.bounds.size.height);
    //customDrawn.shadowOffset = CGSizeMake(0, 3);
    //customDrawn.shadowRadius = 5.0;
//    customDrawn.shadowColor = [UIColor blackColor].CGColor;
//    customDrawn.shadowOpacity = 0.8;
//    customDrawn.cornerRadius = 10.0;
 //   customDrawn.borderColor = [UIColor blackColor].CGColor;
    //customDrawn.borderWidth = 2.0;
   // customDrawn.masksToBounds = YES;
    [self.view.layer addSublayer:customDrawn];
    [customDrawn setNeedsDisplay];

}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context {
  
    CGContextSetLineWidth(context, 10);
    
    UIColor* color = [[UIColor alloc]initWithRed:0 green:0 blue:1 alpha:1];    
    
    
    CGContextSetStrokeColorWithColor(context,color.CGColor);
    
    //Grid
    
    //Vert lines
    CGContextMoveToPoint(context, 200, 100);
    
    CGContextAddLineToPoint(context, 200, 475);
    
    CGContextMoveToPoint(context, 350, 100);
    
    CGContextAddLineToPoint(context, 350, 475);
    
    
    //Hor lines
    CGContextMoveToPoint(context, 100, 200);
    
    CGContextAddLineToPoint(context, 450, 200);
    
    CGContextMoveToPoint(context, 100, 350);
    
    CGContextAddLineToPoint(context, 450, 350);
    
    CGContextStrokePath(context);   
    //////////////////////
    
    color = [[UIColor alloc]initWithRed:1 green:0 blue:0 alpha:1];    
    CGContextSetLineWidth(context, 3);
    
    CGContextSetStrokeColorWithColor(context,color.CGColor);
    
    CGRect rect;
    
    rect.origin.x = 20;
    rect.origin.y = 20;
    rect.size.height = 60;
    rect.size.width = 60;
    
    
    CGContextAddEllipseInRect(context,rect);
    
    
    CGContextStrokePath(context);    
   
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
