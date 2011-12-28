//
//  SiteSwap.m
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwap.h"
#import "SiteSwapThing.h"

@interface SiteSwap (Private)
-(void)createThings;
@end

@implementation SiteSwap

@synthesize current = _current, valid = _valid;
@synthesize pattern = _pattern, things = _things;

- (id)initWithPattern:(NSString *)pattern {
  if (self = [super init]) {
    _pattern = pattern;
    _current = 0;
    _valid = YES;
    [self createThings];
  }
  
  return self;
}

- (NSUInteger)period {
  return [_pattern length];
}

- (void)reset {
  _valid = NO;
  _current = 0;
  [_things enumerateObjectsUsingBlock:^(SiteSwapThing* thing, NSUInteger i, BOOL* stop) {
    [thing reset];
  }];
}

- (NSUInteger)currentThrow {
  NSString* c = [_pattern substringWithRange:NSMakeRange(_current, 1)];
  return (NSUInteger)[c integerValue];
}

- (BOOL)do:(NSUInteger)n {
  SiteSwapThing* thing = [_things objectAtIndex:n];
  if ([thing throws:self.currentThrow]) {
    
    [_things enumerateObjectsUsingBlock:^(SiteSwapThing* thing, NSUInteger i, BOOL* stop) {
      [thing drops];
    }];
    _current = (_current + 1) % self.period;
    _valid = YES;
    
    return YES;
  } else {
    [self reset];
    return NO;
  }
}


- (void)createThings {
  NSUInteger total = 0;
  for (int i = 0; i < self.period; ++i) {
    NSString* c = [_pattern substringWithRange:NSMakeRange(i, 1)];
    NSLog(@"c: %@ Total: %d", c, total);
    total += (NSUInteger)[c integerValue];
  }
  
  NSUInteger n_things = total / self.period;
  if (total % self.period != 0)
    [NSException raise:@"Invalid siteswap" format:@"Siteswap pattern %@ is not valid", _pattern];
  
  NSLog(@"total: %d n_things: %d", total, n_things);
  NSMutableArray* things = [NSMutableArray arrayWithCapacity:n_things];
  for (int i = 0; i < n_things; ++i) {
    [things addObject:[[SiteSwapThing alloc] init]];
  }
  _things = things;
}


@end
