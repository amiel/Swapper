//
//  SiteSwapTest.m
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwapTest.h"
#import "SiteSwapThing.h"

@implementation SiteSwapTest

- (void)setUp {
  SiteSwapTest<SiteSwapTestWithPattern>* this = (SiteSwapTest<SiteSwapTestWithPattern>*) self;
  site_swap = [[SiteSwap alloc] initWithPattern:this.site_swap_pattern];
}

// Don't put any tests here, just inherit

@end

@implementation SiteSwap441Test

- (NSString*)site_swap_pattern {
  return @"441";
}


- (void)testSiteSwapIsSiteSwap {
  BOOL isKlass = [site_swap isKindOfClass:[SiteSwap class]];
  STAssertTrue(isKlass, @"Expected site_swap to be a SiteSwap (was %@)", site_swap.class);
}

- (void)testPattern {
  STAssertEqualObjects(@"441",
                       site_swap.pattern,
                       @"Expected pattern to erturn 441");
}

- (void)testPeriod {
  STAssertEquals(3, (int)site_swap.period,
                 @"Expected period to be 3 was %d", site_swap.period);
}

- (void)testNumberOfThings {
  int n_things = [site_swap.things count];
  STAssertEquals(3, n_things,
                 @"Expected there to be 3 things (was %d)", n_things);
}

- (void)testThingsAreThings {
  for (id thing in site_swap.things) {
    BOOL isKlass = [thing isKindOfClass:[SiteSwapThing class]];
    STAssertTrue(isKlass, @"Expected thing to be a SiteSwapThing (was %@)", [thing class]);
  }
}

- (void)testCurrentThrow {
  NSUInteger currentThrow = site_swap.currentThrow;
  STAssertEquals((NSUInteger)4, currentThrow, @"Expected currentThrow to return 4 (was %d)", currentThrow);
}

@end

@implementation SiteSwap55514Test

- (NSString*)site_swap_pattern {
  return @"55514";
}

- (void)testPattern {
  STAssertEqualObjects(@"55514",
                       site_swap.pattern,
                       @"Expected pattern to erturn 441");
}

- (void)testPeriod {
  STAssertEquals(5, (int)site_swap.period,
                 @"Expected period to be 5 was %d", site_swap.period);
}


- (void)testNumberOfThings {
  int n_things = [site_swap.things count];
  STAssertEquals(4, n_things,
                 @"Expected there to be 4 things (was %d)", n_things);
}


@end