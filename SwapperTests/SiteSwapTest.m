//
//  SiteSwapTest.m
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwapTest.h"

@implementation SiteSwapTest

- (SiteSwap*)site_swap {
  SiteSwapTest<SiteSwapTestWithPattern>* this = (SiteSwapTest<SiteSwapTestWithPattern>*) self;
  return [[SiteSwap alloc] initWithPattern:this.site_swap_pattern];
}

@end

@implementation SiteSwap441Test

- (NSString*)site_swap_pattern {
  return @"441";
}


- (void)testPattern {
  STAssertEqualObjects(@"441",
                       self.site_swap.pattern,
                       @"Expected pattern to erturn 441");
}

- (void)testPeriod {
  STAssertEquals(3, (int)self.site_swap.period,
                 @"Expected period to be 3 was %d", self.site_swap.period);
}

- (void)testNumberOfThings {
  int n_things = [self.site_swap.things count];
  STAssertEquals(3, n_things,
                 @"Expected there to be 3 things (was %d)", n_things);
}


@end

@implementation SiteSwap55514Test

- (NSString*)site_swap_pattern {
  return @"55514";
}


- (void)testPattern {
  STAssertEqualObjects(@"55514",
                       self.site_swap.pattern,
                       @"Expected pattern to erturn 441");
}


- (void)testPeriod {
  STAssertEquals(5, (int)self.site_swap.period,
                 @"Expected period to be 5 was %d", self.site_swap.period);
}


- (void)testNumberOfThings {
  int n_things = [self.site_swap.things count];
  STAssertEquals(5, n_things,
                 @"Expected there to be 5 things (was %d)", n_things);
}


@end