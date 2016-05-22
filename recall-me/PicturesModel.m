//
//  PicturesModel.m
//  Recall
//
//  Created by Tanvir Kazi on 24/03/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//


#import "PicturesModel.h"
#import "TBXML.h"    


@interface PicturesModel()

-(void)InitData;
- (void) InitPictures:(TBXMLElement *)element;
@end


@implementation PicturesModel

@synthesize CurrentPicture=_currentPict;
@synthesize NumCorrectAnswers;


#pragma mark -
#pragma mark init / dealloc methods

-(PicturesModel*)init
{
	self = [super init];
	
	if (self) {
		
        [self InitData];		
	}
	
	return self;	
}

-(void)InitData
{
    NSError* error; 
    
    _currentPictureIndex            = 0;
	
    TBXML* tbxml                    = [TBXML tbxmlWithXMLFile:@"Pictures.xml" error:&error];
    
    _pictures                       = [NSMutableArray arrayWithCapacity:20];
    
    TBXMLElement* rootXMLElement    = tbxml.rootXMLElement->firstChild;
    
    [self InitPictures:rootXMLElement];
    
    self.CurrentPicture             = [_pictures objectAtIndex:_currentPictureIndex];

}

- (void) InitPictures:(TBXMLElement *)element {
    
    int index = 0;
    
    do {    
        
        if ([[TBXML elementName:element] isEqualToString:@"Picture"]) 
        {
            
            Picture* p = [Picture InitWithElement:element];              
            [_pictures insertObject:p atIndex:index++];
        }
        
    } while ((element = element->nextSibling));  
}

#pragma mark -
#pragma public methods

-(int)NumPictures
{
    return _pictures.count;
}

-(BOOL)CanSetNextPicture
{
    return (_currentPictureIndex+1<[_pictures count]);
}

-(void)SetNextPicture
{
    if (_currentPictureIndex+1<[_pictures count]) {
        _currentPictureIndex++;
        self.CurrentPicture = [_pictures objectAtIndex:_currentPictureIndex];
    }
}

-(void)Reset
{
    _currentPictureIndex=-1;
    [self SetNextPicture];
}

@end
