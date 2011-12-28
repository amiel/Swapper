//
//  ViewController.m
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "ViewController.h"
#import "SiteSwapThing.h"


@implementation ViewController

@synthesize site_swap = _site_swap;
@synthesize statusLabel = _statusLabel, patternLabel = _patternLabel;
@synthesize buttons = _buttons;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)redisplayButtonTitles {
  [_site_swap.things enumerateObjectsUsingBlock:^(SiteSwapThing* thing, NSUInteger i, BOOL* stop) {
    UIButton* button = [_buttons objectAtIndex:i];
    NSString* buttonText = [NSString stringWithFormat:@"%d", thing.current];
    [button setTitle:buttonText forState:UIControlStateNormal];
  }];
  
  if (_site_swap.isValid) {
    _statusLabel.text = @"GO, GO, GO";
    self.view.backgroundColor = [UIColor whiteColor];
  } else {
    _statusLabel.text = @"FAIL";
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.9 alpha:1.0];
  }
}


- (void)buttonPressed:(UIButton*)sender {
  NSUInteger index = [_buttons indexOfObject:sender];
  NSLog(@"This button Pressed %d", index);
  [_site_swap do:index];
  [self redisplayButtonTitles];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];

  // Recommended: 441, 55514, 531, 543
  NSString* pattern = @"534";
  
  self.patternLabel.text = pattern;
  self.site_swap = [[SiteSwap alloc] initWithPattern:pattern];
  NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:_site_swap.period];
  [_site_swap.things enumerateObjectsUsingBlock:^(SiteSwapThing* thing, NSUInteger i, BOOL* stop) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    NSString* buttonText = [NSString stringWithFormat:@"%d", thing.current];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [button setTitle:buttonText forState:UIControlStateNormal];
    float w = 50;
    float h = 40;
    float x = 20 + (i * (w + 10));
//    float x = 20 + ( (int)((280 - w) * i) % 280 );
    
    button.frame = CGRectMake(x, 40, w, h);
    [self.view addSubview:button];
    [buttons addObject:button];
  }];
  self.buttons = buttons;
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

@end
