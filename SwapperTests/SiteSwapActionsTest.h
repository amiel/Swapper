//
//  SiteSwapActionsTest.h
//  Swapper
//
//  Created by Amiel Martin on 12/27/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "SiteSwapTest.h"

@interface SiteSwapActionsTest : SiteSwapTest {
  NSString* actions;
  BOOL lastReturn;
}

- (void)setButtonsPressed:(NSString*)input;

- (void)verifyState:(BOOL)expectedReturn
        withCurrent:(NSUInteger)expectedCurrent
          andValues:(NSUInteger)firstValue, ...;
@end

@interface SiteSwap441ActionsTest : SiteSwapActionsTest <SiteSwapTestWithPattern>
@end


@interface SiteSwap55514ActionsTest : SiteSwapActionsTest <SiteSwapTestWithPattern>
@end


@interface SiteSwap534ActionsTest : SiteSwapActionsTest <SiteSwapTestWithPattern>
@end