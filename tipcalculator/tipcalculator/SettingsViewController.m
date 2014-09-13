//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by James (Xinghai) on 9/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipController;
@property (weak, nonatomic) IBOutlet UISwitch *lightSwitch;


- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"default_tip_percentage"];
    [self.defaultTipController setSelectedSegmentIndex:intValue];
    [self.lightSwitch setOn:[defaults integerForKey:@"light_on"]];
    BOOL lightOn = [self.lightSwitch isOn];
    if (lightOn) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor greenColor];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipController.selectedSegmentIndex forKey:@"default_tip_percentage"];
    
    BOOL lightOn = [self.lightSwitch isOn];
    if (lightOn) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = [UIColor greenColor];
    }
    [defaults setBool:lightOn forKey:@"light_on"];
    [defaults synchronize];
}
@end
