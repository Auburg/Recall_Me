//
//  ScenesModel.m
//  recall-me
//
//  Created by Tanvir Kazi on 12/01/2013.
//  Copyright (c) 2013 Hackers. All rights reserved.
//

#import "ScenesModel.h"
#import "HexagonSceneModel.h"
#import "TBXML.h" 

#pragma mark - Private interface

@interface ScenesModel ()

-(void)ProcessFile:(NSString*)file;
-(void)InitScenes:(TBXMLElement *)element;
-(BOOL)CanGetCurrentScene;

@end


@implementation ScenesModel

#pragma mark - impl methods

-(id)initWithSceneFile:(NSString*)file;
{
    if ( self = [super init] ) {         
        
        _currentSceneIndex = 0;
        [self ProcessFile:file];
        
    }
    return self;  
}

-(BOOL)CanGetCurrentScene
{
    return _sceneModels.count>_currentSceneIndex;
}

-(id)GetCurrentScene
{
    if ([self CanGetCurrentScene]) {
        return [_sceneModels objectAtIndex:_currentSceneIndex]; 
    }
    
    return nil;
}

-(BOOL)CanGetNextScene
{
    return _currentSceneIndex+1<_sceneModels.count;
}

-(id)GetNextScene
{
    if ([self CanGetNextScene]) {
       
        return [_sceneModels objectAtIndex:++_currentSceneIndex];
    } 
    
    return nil;
}

#pragma mark - private methods

-(void)ProcessFile:(NSString*)file
{
    NSError* error; 
    
    TBXML* tbxml                    = [TBXML tbxmlWithXMLFile:file error:&error];     
    
    TBXMLElement* rootXMLElement    = tbxml.rootXMLElement;
    
    [self InitScenes:rootXMLElement];
}

- (void)InitScenes:(TBXMLElement *)element
{
    _sceneModels = [[NSMutableArray alloc]init];
    
    if (strncmp(element->name, "Scenes",6)==0) {
        
        TBXMLElement* scene = element->firstChild;
        
        if (strncmp(scene->name, "Scene",5)==0) {
            
            do {
                                
                TBXMLElement* shapeElement = scene->firstChild;
                
                if ([[TBXML elementName:shapeElement] isEqualToString:@"Hexagon"]) 
                {
                    HexagonSceneModel* h = [[HexagonSceneModel alloc]initWithRootHexSceneElement:shapeElement];
                    
                    [_sceneModels addObject:h];                    
                }              
                                
            } while ((scene = scene->nextSibling));             
        }                
    }
}



@end
