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
    
    IBOutlet UIButton *onButton;
    
    BOOL strobeIsOn;
    BOOL strobeActivated; // To allow user to turn off the light all together
    
    FlashController *flashController;
}

@property(nonatomic, retain) NSTimer *strobeTimer;
@property(nonatomic, strong) IBOutlet IBOutlet UIButton *onButton;

@property (nonatomic, assign) BOOL strobeActivated;

@property(nonatomic, retain) FlashController *flashController;

-(IBAction)strobeOn:(id)sender; //combine powerbuttonpressed

- (void)strobeTimerCallback:(id)sender;

- (void)startStopStrobe:(BOOL)strobeOn;


@end
