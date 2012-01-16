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
@property (readonly, getter = isValid) BOOL valid;

-(id)initWithPattern:(NSString*)pattern;

-(NSUInteger)period;
-(NSUInteger)currentThrow;

// TODO: Rename to something that makes more sense
- (BOOL)do:(NSUInteger)n;
@end
