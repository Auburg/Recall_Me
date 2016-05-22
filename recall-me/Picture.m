//
//  Picture.m
//  Recall
//
//  Created by Tanvir Kazi on 26/03/2012.
//  Copyright (c) 2012 Hackers. All rights reserved.
//

#import "Picture.h"

#pragma mark -
#pragma mark interface Question
@interface Question()

+(Question*)InitQuestion:(NSString *)question withAnswer:(NSString*)a;

@end

#pragma mark -
#pragma mark @implementation Question
@implementation Question

@synthesize Question=_question;
@synthesize Answer=_answer;


+(Question*)InitQuestion:(NSString *)question withAnswer:(NSString*)a
{
    Question* q = [Question alloc];
    
    if (q!=Nil) {
        q.Question  = question;
        q.Answer    = a;
        return q;
    }
    else
    {
        return NULL;
    }
}

@end

#pragma mark -
#pragma mark interface Picture
@interface Picture()


+(void)InitPicture:(Picture *)picture withElement:(TBXMLElement*)e;
- (void) TraverseElement:(TBXMLElement *)element;

@end

#pragma mark -
#pragma mark @implementation Picture
@implementation Picture

@synthesize Image=_image;
@synthesize NumQuestions=_numQuestions;
@synthesize Questions=_questions;

+ (Picture*)InitWithElement:(TBXMLElement *)element
{
    Picture* p = [Picture alloc];
    
    if (p!=NULL) {
        
        [Picture InitPicture:p withElement:element];
        return p;
        
    }
    else
    {
        return NULL;
    } 
}

+(void)InitPicture:(Picture *)picture withElement:(TBXMLElement*)e
{
    
    [picture TraverseElement:e];

}

- (void) TraverseElement:(TBXMLElement *)element
{
    //do {
//        if (element->firstChild) 
//            [self TraverseElement:element->firstChild];
        
        //if ([[TBXML elementName:element] isEqualToString:@"Picture"]) {
            
            NSString* numQuestions      = [TBXML valueOfAttributeNamed:@"numQuestions" forElement:element];
            TBXMLElement *image         = [TBXML childElementNamed:@"Image" parentElement:element];
            
            self.NumQuestions           = [numQuestions intValue];
            self.Image                  = [TBXML textForElement:image];
            
            self.Questions              = [NSMutableArray arrayWithCapacity:self.NumQuestions];
            
            TBXMLElement* questionElem  = image->nextSibling;
            
            while (questionElem) {
                NSString* question  = [TBXML textForElement:questionElem];
                NSString* answer    = [TBXML valueOfAttributeNamed:@"Answer" forElement:questionElem];
                
                Question* q         = [Question InitQuestion:question withAnswer:answer];
                
                [self.Questions addObject:q];                
                
                questionElem        = questionElem->nextSibling;
            }            
       // }
   // } while ((element = element->nextSibling));  
}


@end
