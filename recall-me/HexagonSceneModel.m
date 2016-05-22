//
//  HexagonSceneModel.m
//  recall-me
//
//  Created by Tanvir Kazi on 29/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "HexagonSceneModel.h"
#import "HexagonLayerModel.h"
#import "SegmentData.h"
#import "TBXML.h" 

#pragma mark - Private interface

@interface HexagonSceneModel ()

-(void)ProcessElement:(TBXMLElement*)e;
-(void)InitHexagon:(TBXMLElement *)hexagonElement;
-(NSMutableArray*)InitColours:(TBXMLElement *)rootColoursElement;
-(NSMutableArray*)InitSegments:(TBXMLElement *)segmentsElementRoot withColors:(NSArray*)c;
-(UIColor*)UIColourFromString:(NSString*)str;

@end

@implementation HexagonSceneModel

@synthesize HexagonModels;


#pragma mark - Init method

-(id)initWithRootHexSceneElement:(TBXMLElement*)e
{
    if ( self = [super init] ) {
        
        self.HexagonModels = [[NSMutableArray alloc]init];        
        
        [self ProcessElement:e];
        
    }
    return self;  
}

#pragma mark - Private methods

-(void)ProcessElement:(TBXMLElement*)e
{
    do {    
        
        if ([[TBXML elementName:e] isEqualToString:@"Hexagon"]) 
        {
            [self InitHexagon:e];                
        }
        
    } while ((e = e->nextSibling)); 

}


-(void)InitHexagon:(TBXMLElement *)hexagonElement
{
    NSString* lineLengthStr         = [TBXML valueOfAttributeNamed:@"lineLength" forElement:hexagonElement];               
    
    int lineLngth                   = [lineLengthStr intValue];
    
    TBXMLElement* coloursElement    = hexagonElement->firstChild;
    
    if ([[TBXML elementName:coloursElement] isEqualToString:@"Colours"]) 
    {
        NSMutableArray* colours = [self InitColours:coloursElement];
        
        if ([[TBXML elementName:hexagonElement->nextSibling] isEqualToString:@"Segments"]) 
        {
            NSMutableArray* segments = [self InitSegments:hexagonElement->nextSibling withColors:colours];   
            
            HexagonLayerModel* hexagon = [[HexagonLayerModel alloc]initWithSegmentData:segments length:lineLngth];
            
            [self.HexagonModels addObject:hexagon];
            
        }
    }
    
    
}

-(NSMutableArray*)InitColours:(TBXMLElement *)rootColoursElement
{
    NSMutableArray* colours = [[NSMutableArray alloc]init];
    
    TBXMLElement* coloursElement    = rootColoursElement->firstChild;
    
    do { 
        
       NSString* colorStr = [NSString stringWithFormat:@"%s" , coloursElement->name] ;
        
       NSString* selStr = [colorStr stringByAppendingString:@"Color"];
       
        UIColor* color = [self UIColourFromString:selStr];
        
        if (color!=nil) {
            [colours addObject:color]; 
        }
        

    } while ((coloursElement = coloursElement->nextSibling));
    
    return colours;
}

-(NSMutableArray*)InitSegments:(TBXMLElement *)segmentsElementRoot withColors:(NSArray*)c
{
    NSMutableArray* segments        = [[NSMutableArray alloc]init];
    
    TBXMLElement* segmentsElement   = segmentsElementRoot->firstChild;
    
    do { 
        
        NSString* ciStr         = [TBXML valueOfAttributeNamed:@"ci" forElement:segmentsElement]; 
        
        if (ciStr!=nil) {
            
            int ci              = [ciStr intValue];     
            int ti = ci;
            
            NSString* tiStr     = [TBXML valueOfAttributeNamed:@"ti" forElement:segmentsElement];
            
            if (tiStr!=nil) {
                ti = [tiStr intValue];
            }
            
            SegmentData* segment =  [[SegmentData alloc]initWithColor:c colourIndex:ci targetColourIndex:ti];
            
            [segments addObject:segment];            
            
        }        
        
        
    } while ((segmentsElement = segmentsElement->nextSibling));
    
    return segments;
}

-(UIColor*)UIColourFromString:(NSString*)str
{
    SEL colSel = NSSelectorFromString(str);
    UIColor* tColor = nil;
    if ([UIColor respondsToSelector: colSel])
        tColor  = [UIColor performSelector:colSel];
    
    return tColor;
}

@end
