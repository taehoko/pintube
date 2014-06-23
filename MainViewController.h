//
//  MainViewController.h
//  pintube
//
//  Created by Taeho Ko on 6/19/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <
    UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;


@end