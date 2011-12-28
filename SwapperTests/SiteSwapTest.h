//
//  SiteSwapTest.h
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>
#import "SiteSwap.h"
#import "SiteSwapThing.h"

@protocol SiteSwapTestWithPattern <NSObject>
- (NSString*)site_swap_pattern;
@end

@interface SiteSwapTest : SenTestCase {
  SiteSwap* site_swap;
}
@end


@interface SiteSwap441Test : SiteSwapTest <SiteSwapTestWithPattern>
@end


@interface SiteSwap55514Test : SiteSwapTest <SiteSwapTestWithPattern>
@end

@interface SiteSwapInvalidTest : SiteSwapTest <SiteSwapTestWithPattern>
@end
