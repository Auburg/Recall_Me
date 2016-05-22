//
//  HexagonSceneModel.h
//  recall-me
//
//  Created by Tanvir Kazi on 29/12/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h" 

@interface HexagonSceneModel : NSObject

-(id)initWithRootHexSceneElement:(TBXMLElement*)e;

@property (nonatomic,retain) NSMutableArray* HexagonModels;

@end
