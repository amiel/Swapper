//
//  SiteSwapThing.m
//  Swapper
//
//  Created by Amiel Martin on 12/27/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwapThing.h"

@implementation SiteSwapThing

@synthesize current = _current;

- (BOOL)hasValue {
  return !(_current < 1);
}

- (BOOL)throws:(NSUInteger)n {
  if (![self hasValue]) {
    _current = n;
    return YES;
  } else {
    return NO;
  }
}

- (void)drops {
  if ([self hasValue]) --_current;
}

- (void)reset {
  _current = 0;
}

@end
