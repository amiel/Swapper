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

@synthesize current = _current;
@synthesize pattern = _pattern, things = _things;

- (id)initWithPattern:(NSString *)pattern {
  if (self = [super init]) {
    _pattern = pattern;
    _current = 0;
    [self createThings];
  }
  
  return self;
}

- (NSUInteger)period {
  return [_pattern length];
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
    //     _current = (_current + 1) % self.period;
    ++_current;
    return YES;
  } else {
    return NO;
  }
}


- (void)createThings {
  NSMutableArray* things = [NSMutableArray arrayWithCapacity:self.period];
  for (int i = self.period; i > 0; --i) {
    [things addObject:[[SiteSwapThing alloc] init]];
  }
  _things = things;
}


@end
