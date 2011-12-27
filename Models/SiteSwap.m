//
//  SiteSwap.m
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "SiteSwap.h"

@implementation SiteSwap

- (id)initWithPattern:(NSString *)pattern {
  if (self = [super init]) {
    _pattern = pattern;
//    _things = [[NSArray alloc] initWithObjects:@"FOOBAR" count:self.period];
  }
  
  return self;
}

- (NSString*)pattern {
  return _pattern;
}


- (NSUInteger)period {
  return [_pattern length];
}

- (NSArray*)things {
  return _things;
}

@end
