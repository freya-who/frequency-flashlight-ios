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

@implementation ViewController

@synthesize strobeTimer;
@synthesize onButton;
@synthesize flashController;
@synthesize strobeActivated;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    strobeIsOn = NO;
	strobeActivated = NO;
	
	flashController = [[FlashController alloc] init];
	
	self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
}



- (void)strobeTimerCallback:(id)sender {
	if (strobeActivated) {
		strobeIsOn = !strobeIsOn;
		[self startStopStrobe:strobeIsOn];
	}
    else {
        [self startStopStrobe:NO];
    }
}



- (IBAction)strobeOn:(id)sender {
	if(strobeActivated) {
		strobeActivated = NO;
	} else {
		strobeActivated = YES;
	}
    
//	[self startStopStrobe:strobeActivated];
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
