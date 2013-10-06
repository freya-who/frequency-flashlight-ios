//
//  ViewController.h
//  FrequencyFlashlight
//
//  Created by Frederike Schmitz on 25.09.13.
//  Copyright (c) 2013 Frederike Schmitz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashController.h"

@interface ViewController : UIViewController
{
    NSTimer *strobeTimer;
    NSTimer *strobeFlashTimer;
    
    IBOutlet UIButton *onButton;
    IBOutlet UIButton *offButton;
    
    BOOL strobeIsOn;
    BOOL strobeActivated; // To allow user to turn off the light all together
	BOOL strobeFlashOn; // For our code to turn strobe on and off rapidly
    
    FlashController *flashController;
}

@property(nonatomic, retain) NSTimer *strobeTimer;
@property (nonatomic, retain) NSTimer *strobeFlashTimer;
@property(nonatomic, strong) IBOutlet IBOutlet UIButton *onButton;
@property(nonatomic, strong) IBOutlet IBOutlet UIButton *offButton;

@property (nonatomic, assign) BOOL strobeActivated;

@property(nonatomic, retain) FlashController *flashController;

-(IBAction)strobeOn:(id)sender; //combine powerbuttonpressed
-(IBAction)strobeOff:(id)sender;

- (IBAction)onStrobeSwitch:(id)sender;


- (void)strobeTimerCallback:(id)sender;
- (void)strobeFlashTimerCallback:(id)sender;

- (void)startStopStrobe:(BOOL)strobeOn;


@end
