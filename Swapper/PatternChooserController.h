//
//  PatternChooserController.h
//  Swapper
//
//  Created by Amiel Martin on 1/13/12.
//  Copyright (c) 2012 Carnes Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PatternChooserDelegate <NSObject>
- (void)chosePattern:(NSString*)pattern;
@end

@interface PatternChooserController : UITableViewController
@property (weak, nonatomic) id<PatternChooserDelegate> delegate;

+ (NSArray*)patterns;
@end
