//
//  ViewController.m
//  FrequencyFlashlight
//
//  Created by Frederike Schmitz on 25.09.13.
//  Copyright (c) 2013 Frederike Schmitz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


//THIS IS A TEST TO SEE IF XCODE AND GITHUB WORK TOGETHER
@implementation ViewController

@synthesize strobeTimer, strobeFlashTimer;
@synthesize offButton, onButton;
@synthesize flashController;
@synthesize strobeActivated;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    strobeIsOn = NO;
	strobeActivated = NO;
	strobeFlashOn = NO;
	
	flashController = [[FlashController alloc] init];
	
	self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
	self.strobeFlashTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(strobeFlashTimerCallback:) userInfo:nil repeats:YES];
    
}



- (void)strobeTimerCallback:(id)sender {
	if (strobeActivated) {
		strobeIsOn = !strobeIsOn;
		strobeFlashOn = YES;
	} else {
		strobeFlashOn = NO;
	}
}

- (void)strobeFlashTimerCallback:(id)sender {
	if (strobeFlashOn) {
		strobeFlashOn = !strobeFlashOn;
		[self startStopStrobe:strobeIsOn];
	} else {
		[self startStopStrobe:NO];
	}
}


- (IBAction)strobeOn:(id)sender {
	if(strobeActivated) {
		strobeActivated = NO;
	} else {
		strobeActivated = YES;
	}
    
	[self startStopStrobe:strobeActivated];
}


- (IBAction)strobeOff:(id)sender {
	if(strobeActivated) {
		strobeActivated = NO;
	} else {
		strobeActivated = YES;
	}
    
	[self startStopStrobe:strobeActivated];
}


- (IBAction)onStrobeSwitch:(id)sender {
	UISwitch *mySwitch = sender;
	strobeActivated = mySwitch.on;
	
	[self startStopStrobe:strobeActivated];
	
	if(strobeActivated) {
		
	} else {
		
	}
}

- (void)startStopStrobe:(BOOL)strobeOnBool {
	if (strobeOnBool) {
		[flashController toggleStrobe:YES];
	} else {
		[flashController toggleStrobe:NO];
	}
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
