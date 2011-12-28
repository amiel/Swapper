//
//  SiteSwapThing.h
//  Swapper
//
//  Created by Amiel Martin on 12/27/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//



@interface SiteSwapThing : NSObject

@property NSUInteger current;

- (BOOL)throws:(NSUInteger)n;
- (void)drops;
- (void)reset;

@end
