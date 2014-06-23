//
//  PlayerViewController.m
//  pintube
//
//  Created by Taeho Ko on 6/20/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "PlayerViewController.h"

@interface PlayerViewController ()
- (IBAction)onDoneTouchUp:(id)sender;

@end

@implementation PlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDoneTouchUp:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
