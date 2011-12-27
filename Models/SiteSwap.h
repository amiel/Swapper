//
//  SiteSwap.h
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//



@interface SiteSwap : NSObject {
  NSString* _pattern;
  NSArray* _things;
}

-(id)initWithPattern:(NSString*)pattern;

-(NSString*)pattern;
-(NSUInteger)period;

-(NSArray*)things;
@end
