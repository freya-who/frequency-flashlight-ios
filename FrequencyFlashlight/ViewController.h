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
    IBOutlet UIButton *offButton;
    IBOutlet UISlider *frequencySlider;
    IBOutlet UITextField *frequencyTextField;
    
    BOOL strobeIsOn;
    BOOL strobeActivated; // To allow user to turn off the light all together
    
    FlashController *flashController;
}

@property(nonatomic, retain) NSTimer *strobeTimer;

@property(nonatomic, retain) IBOutlet UIButton *onButton;
@property(nonatomic, retain) IBOutlet UIButton *offButton;
@property(nonatomic, retain) IBOutlet UISlider *frequencySlider;
@property(nonatomic, retain) IBOutlet UITextField *frequencyTextField;

@property (nonatomic, assign) BOOL strobeActivated;

@property(nonatomic, retain) FlashController *flashController;

-(IBAction)strobeOn:(id)sender;
-(IBAction)strobeOff:(id)sender;
-(IBAction)sliderValueChanged:(id)sender;
-(IBAction)changeButtonPressed:(id)sender;

- (void)strobeTimerCallback:(id)sender;



@end
