//
//  SiteSwapActionsTest.m
//  Swapper
//
//  Created by Amiel Martin on 12/27/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwapActionsTest.h"

@implementation SiteSwapActionsTest

- (void)setActions:(NSString*)input {
  NSString* c; NSUInteger a;
  for (NSUInteger i = 0; i < [input length]; ++i) {
    c = [input substringWithRange:NSMakeRange(i, 1)];
    a = (NSUInteger)[c integerValue];
    [site_swap do:a];
  }
}

@end

@interface SiteSwapThing (ExposePrivates)
- (BOOL)hasValue;
@end


@implementation SiteSwap441ActionsTest

- (NSString*)site_swap_pattern {
  return @"441";
}

- (void)testOneAction {
  [self setActions:@"0"];
  
  NSUInteger current = site_swap.current;
  STAssertEquals((NSUInteger)1, current, @"Expect current to be 1 (was %d)", current);
  
  SiteSwapThing* first = [site_swap.things objectAtIndex:0];  
  STAssertTrue([first hasValue], @"Expect first to have a value");
  STAssertEquals((NSUInteger)3, [first current], @"Expect first things current to be 3 (was %d)", [first current]);
  
  SiteSwapThing* second = [site_swap.things objectAtIndex:1];
  STAssertFalse([second hasValue], @"Expect second to not have a value");
  STAssertEquals((NSUInteger)nil, [second current], @"Expect second things current to be nil");
  
  SiteSwapThing* third = [site_swap.things objectAtIndex:2];
  STAssertFalse([third hasValue], @"Expect second to not have a value");
  STAssertEquals((NSUInteger)nil, [third current], @"Expect third things current to be nil");
}

@end



@implementation SiteSwap55514ActionsTest

- (NSString*)site_swap_pattern {
  return @"55514";
}

@end