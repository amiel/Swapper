//
//  SiteSwap.h
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//



@interface SiteSwap : NSObject

@property (readonly) NSUInteger current;
@property (readonly, strong) NSString* pattern;
@property (readonly, strong) NSArray* things;

-(id)initWithPattern:(NSString*)pattern;

-(NSUInteger)period;
-(NSUInteger)currentThrow;

- (BOOL)do:(NSUInteger)n;
@end
