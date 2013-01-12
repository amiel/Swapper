//
//  ViewController.m
//  Swapper
//
//  Created by Amiel Martin on 12/26/11.
//  Copyright (c) 2011 Carnes Media. All rights reserved.
//

#import "ViewController.h"
#import "SiteSwapThing.h"
#import "PatternChooserController.h"


@implementation ViewController
//
//@synthesize site_swap = _site_swap, pattern = _pattern;
//@synthesize statusLabel = _statusLabel, patternLabel = _patternLabel;
//@synthesize buttons = _buttons, labels = _labels;
//@synthesize showsCheats = _showsCheats;

static NSArray* _layouts;

+ (NSArray*)layouts {
  if (!_layouts ) {
    _layouts = @[
      @[],
      @[],
      @[@[@60, @190], @[@180, @190]],
      @[@[@60, @140], @[@180, @140],
            @[@120, @240]],
      @[@[@60, @140], @[@180, @140],
        @[@60, @240], @[@180, @240]],
      @[@[@60, @100], @[@180, @100],
        @[@20, @200], @[@220, @200],
            @[@120, @290]],
    ];
  }
  return _layouts;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


- (void)setupWithPattern:(NSString *)pattern {
  
  self.pattern = pattern;
  self.patternLabel.text = pattern;
  self.site_swap = [[SiteSwap alloc] initWithPattern:pattern];

  NSArray* layout = [[self.class layouts] objectAtIndex:_site_swap.things.count];

  NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:_site_swap.period];
  NSMutableArray* labels = [[NSMutableArray alloc] initWithCapacity:_site_swap.period];
  [_site_swap.things enumerateObjectsUsingBlock:^(SiteSwapThing* thing, NSUInteger i, BOOL* stop) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    NSString* buttonText = [NSString stringWithFormat:@"%d", thing.current];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    //    [button setTitle:buttonText forState:UIControlStateNormal];
    float w = 80;
    float h = 60;
    float x = [[[layout objectAtIndex:i] objectAtIndex:0] floatValue];
    float y = [[[layout objectAtIndex:i] objectAtIndex:1] floatValue];
    
    button.frame = CGRectMake(x, y, w, h);
    [self.view addSubview:button];
    [buttons addObject:button];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(x, y - 40, w, h)];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
    [labels addObject:label];
  }];
  self.buttons = buttons;
  self.labels = labels;

}

- (void)cleanup {
  self.patternLabel.text = nil;
  self.site_swap = nil;

  [_buttons enumerateObjectsUsingBlock:^(UIButton* button, NSUInteger i, BOOL* stop) {
    [button removeFromSuperview];
  }];
  
  [_labels enumerateObjectsUsingBlock:^(UILabel* label, NSUInteger i, BOOL* stop) {
    [label removeFromSuperview];
  }];
  
  self.buttons = nil;
  self.labels = nil;
}

- (void)reset {
  [self cleanup];
  [self setupWithPattern:self.pattern];
}


- (void)redisplayLabels:(NSUInteger)index {
  [_site_swap.things enumerateObjectsUsingBlock:^(SiteSwapThing* thing, NSUInteger i, BOOL* stop) {
    UILabel* label = [_labels objectAtIndex:i];
    if (_showsCheats) {
      label.text = [NSString stringWithFormat:@"%d", thing.current];
    } else {
      label.text = nil;
    }
  }];
  
  if (_site_swap.isValid) {
    _statusLabel.text = @"GO, GO, GO";
    self.view.backgroundColor = [UIColor whiteColor];
  } else {
    _statusLabel.text = @"FAIL";
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.9 alpha:1.0];
    [self reset];
  }
}


- (void)buttonPressed:(UIButton*)sender {
  NSUInteger index = [_buttons indexOfObject:sender];
  NSLog(@"This button Pressed %d", index);
  NSString* buttonText = [NSString stringWithFormat:@"%d", [_site_swap currentThrow]];
  [sender setTitle:buttonText forState:UIControlStateNormal];
  [_site_swap do:index];
  [self redisplayLabels:index];
}


- (IBAction)cheatValueChanged:(UISwitch*)sender {
  _showsCheats = [sender isOn];
}

- (IBAction)showPatternController:(id)sender { 
  PatternChooserController* controller = [[PatternChooserController alloc] init];
  controller.delegate = self;
  [self presentModalViewController:controller animated:YES];
}

- (void)chosePattern:(NSString *)pattern {
  [self cleanup];
  [self setupWithPattern:pattern];
  [self.modalViewController dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  NSString* startingPattern = [[PatternChooserController patterns] objectAtIndex:0];
  [self setupWithPattern:startingPattern];
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
