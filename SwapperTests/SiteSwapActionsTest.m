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
    lastReturn = [site_swap do:a];
  }
}

@end


@implementation SiteSwap441ActionsTest

- (NSString*)site_swap_pattern {
  return @"441";
}

- (void)verifyState:(BOOL)expectedReturn
        withCurrent:(NSUInteger)expectedCurrent
           andFirst:(NSUInteger)expectedFirstValue
          andSecond:(NSUInteger)expectedSecondValue
           andThird:(NSUInteger)expectedThirdValue {
  
  if (expectedReturn) {
    STAssertTrue(lastReturn, @"Expect the lastReturn to be true");
  } else {
    STAssertFalse(lastReturn, @"Expect the lastReturn to be false");
  }
  
  NSUInteger current = site_swap.current;
  STAssertEquals(expectedCurrent, current, nil);
  
  SiteSwapThing* first = [site_swap.things objectAtIndex:0];  
  STAssertEquals(expectedFirstValue, [first current], nil);
  
  SiteSwapThing* second = [site_swap.things objectAtIndex:1];
  STAssertEquals(expectedSecondValue, [second current], nil);
  
  SiteSwapThing* third = [site_swap.things objectAtIndex:2];
  STAssertEquals(expectedThirdValue, [third current], nil);
}


- (void)testOneAction {
  [self setActions:@"0"];
  [self verifyState:YES withCurrent:1 andFirst:3 andSecond:0 andThird:0];
}

- (void)testTwoActions {
  [self setActions:@"01"];
  [self verifyState:YES withCurrent:2 andFirst:2 andSecond:3 andThird:0];
}


- (void)testThreeActions {
  [self setActions:@"012"];
  [self verifyState:YES withCurrent:0 andFirst:1 andSecond:2 andThird:0];
}

- (void)testFourActions {
  [self setActions:@"0122"];
  [self verifyState:YES withCurrent:1 andFirst:0 andSecond:1 andThird:3];
}


- (void)testFourActionsIncorrect {
  [self setActions:@"0120"];
  [self verifyState:NO withCurrent:0 andFirst:0 andSecond:0 andThird:0];
}

@end



@implementation SiteSwap55514ActionsTest

- (NSString*)site_swap_pattern {
  return @"55514";
}

@end