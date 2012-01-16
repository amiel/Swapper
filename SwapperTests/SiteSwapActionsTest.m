//
//  SiteSwapActionsTest.m
//  Swapper
//
//  Created by Amiel Martin on 12/27/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwapActionsTest.h"

@implementation SiteSwapActionsTest

- (void)setButtonsPressed:(NSString*)input {
  NSString* c; NSUInteger a;
  for (NSUInteger i = 0; i < [input length]; ++i) {
    c = [input substringWithRange:NSMakeRange(i, 1)];
    a = (NSUInteger)[c integerValue];
    lastReturn = [site_swap do:a];
  }
}



- (void)verifyState:(BOOL)expectedReturn
        withCurrent:(NSUInteger)expectedCurrent
          andValues:(NSUInteger)firstValue, ... {

  if (expectedReturn) {
    STAssertTrue(lastReturn, @"Expect the lastReturn to be true");
    STAssertTrue(site_swap.isValid, @"Expect site swap to be valid");
  } else {
    STAssertFalse(lastReturn, @"Expect the lastReturn to be false");
    STAssertFalse(site_swap.isValid, @"Expect site swap not to be valid");
  }

  NSUInteger current = site_swap.current;
  STAssertEquals(current, expectedCurrent, nil);

  va_list args;
  va_start(args, firstValue);
  NSUInteger expectedValue = firstValue;
  for (int i = 0; i < [site_swap.things count]; ++i) {
    SiteSwapThing* thing = [site_swap.things objectAtIndex:i];
    STAssertEquals([thing current], expectedValue,
                   @"Expect value of object %d to be %d (was %d)", i, expectedValue, [thing current]);
    expectedValue = va_arg(args, NSUInteger);
  }
  va_end(args);
}

@end


@implementation SiteSwap441ActionsTest

- (NSString*)site_swap_pattern {
  return @"441";
}

- (void)testOneAction {
  [self setButtonsPressed:@"0"];
  [self verifyState:YES withCurrent:1 andValues:3, 0, 0];
}

- (void)testTwoActions {
  [self setButtonsPressed:@"01"];
  [self verifyState:YES withCurrent:2 andValues:2, 3, 0];
}


- (void)testThreeActions {
  [self setButtonsPressed:@"012"];
  [self verifyState:YES withCurrent:0 andValues:1, 2, 0];
}

- (void)testFourActions {
  [self setButtonsPressed:@"0122"];
  [self verifyState:YES withCurrent:1 andValues:0, 1, 3];
}


- (void)testFourActionsIncorrect {
  [self setButtonsPressed:@"0120"];
  [self verifyState:NO withCurrent:0 andValues:0, 0, 0];
}

- (void)testFiveActions {
  [self setButtonsPressed:@"01220"];
  [self verifyState:YES withCurrent:2 andValues:3, 0, 2];
}

- (void)testIncorrectThenCorrect {
  [self setButtonsPressed:@"012001220"];
  [self verifyState:YES withCurrent:2 andValues:3, 0, 2];
}

@end



@implementation SiteSwap55514ActionsTest

- (NSString*)site_swap_pattern {
  return @"55514";
}

@end


@implementation SiteSwap534ActionsTest

- (NSString*)site_swap_pattern {
  return @"534";
}


- (void)testOneAction {
  [self setButtonsPressed:@"0"];
  [self verifyState:YES withCurrent:1 andValues:4, 0, 0, 0];
}


- (void)testManyActions {
  [self setButtonsPressed:@"012310213"];
  [self verifyState:YES withCurrent:0 andValues:0, 1, 2, 3];
}

- (void)testManyMoreActions {
  [self setButtonsPressed:@"01231021301231"];
  [self verifyState:YES withCurrent:2 andValues:0, 2, 1, 3];
}

- (void)testFailureAfterManyMoreActions {
  [self setButtonsPressed:@"012310213012313"];
  [self verifyState:NO withCurrent:0 andValues:0, 0, 0, 0];
}

@end


