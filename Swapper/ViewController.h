//
//  ViewController.h
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SiteSwap.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) SiteSwap* site_swap;
@property (nonatomic, strong) IBOutlet UILabel* patternLabel;
@property (nonatomic, strong) IBOutlet UILabel* statusLabel;
@property (nonatomic, strong) NSArray* buttons;
@end
