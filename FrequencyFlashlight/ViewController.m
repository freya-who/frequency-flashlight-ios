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
@synthesize onButton, offButton, frequencySlider, frequencyTextField;
@synthesize flashController;
@synthesize strobeActivated;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    strobeIsOn = NO;
	strobeActivated = NO;
	
	flashController = [[FlashController alloc] init];
    
    frequencyTextField.text = [NSString stringWithFormat:@"%.2f", [self.frequencySlider value]];
    
    //self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
}



- (void)strobeTimerCallback:(id)sender {
	if (strobeActivated) {
		strobeIsOn = !strobeIsOn;
        [flashController toggleStrobe:strobeIsOn];
	}
    else {
        [flashController toggleStrobe:NO];
    }
}

- (IBAction)strobeOn:(id)sender {
    
    onButton.hidden = YES;
    offButton.hidden = NO;
    
    strobeActivated = YES;
    
    [self.strobeTimer invalidate];
    
    self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:(1./(2.*[self.frequencySlider value])) target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
}

- (IBAction)strobeOff:(id)sender {
    
    onButton.hidden = NO;
    offButton.hidden = YES;
    
    strobeActivated = NO;
    
    [self.strobeTimer invalidate];
    
    [flashController toggleStrobe:NO];
}


- (IBAction) sliderValueChanged:(UISlider *)sender {
    frequencyTextField.text = [NSString stringWithFormat:@"%.2f", [sender value]];
    
    [self.strobeTimer invalidate];
    
    self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:(1./(2.*[sender value])) target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
}

- (IBAction) changeButtonPressed:(id)sender {
    NSString *textValue = [frequencyTextField text];
    float value = [textValue floatValue];
    if (value < 0.1) value = 0.1;
    if (value > 100) value = 100;
    frequencySlider.value = value;
    frequencyTextField.text = [NSString stringWithFormat:@"%.2f", value];
    if ([frequencyTextField canResignFirstResponder]) [frequencyTextField resignFirstResponder];
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (frequencyTextField) {
        if ([frequencyTextField canResignFirstResponder]) [frequencyTextField resignFirstResponder];
    }
    [super touchesBegan: touches withEvent: event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
