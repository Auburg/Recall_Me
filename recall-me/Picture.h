//
//  Picture.h
//  Recall
//
//  Created by Tanvir Kazi on 26/03/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBXML.h"   

@interface Question : NSObject {
@private 
    NSString* _answer;
    NSString* _question;
    
}

@property (retain,nonatomic) NSString* Question;
@property (retain,nonatomic) NSString* Answer;

@end

@interface Picture : NSObject
{
    NSString* _image;
    int _numQuestions;
    NSMutableArray* _questions; 
}

@property (retain,nonatomic) NSString* Image;
@property (retain,nonatomic) NSMutableArray* Questions;
@property  int NumQuestions;

+ (Picture*)InitWithElement:(TBXMLElement *)element;

@end
