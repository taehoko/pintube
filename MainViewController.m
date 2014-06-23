//
//  MainViewController.m
//  pintube
//
//  Created by Taeho Ko on 6/19/14.
//  Copyright (c) 2014 google. All rights reserved.
//

#import "MainViewController.h"
#import "PlayerViewController.h"
#import "TTTAttributedLabel.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIImageView *videoView;
@property (weak, nonatomic) IBOutlet UIView *commentView; 
@property (weak, nonatomic) IBOutlet UIView *profileView;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@property (weak, nonatomic) IBOutlet UIView *likeContainerView;
@property (nonatomic) BOOL likedState;
@property (weak, nonatomic) IBOutlet UIImageView *likeImageView;
- (IBAction)onLikeTouchUp:(id)sender;
- (IBAction)onLikeTouchDown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *likeCountLabel;

@property (weak, nonatomic) IBOutlet UIView *heartContainerView;
@property (nonatomic) BOOL heartedState;
@property (weak, nonatomic) IBOutlet UIImageView *heartImageView;
- (IBAction)onHeartTouchUp:(id)sender;
- (IBAction)onHeartTouchDown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *heartCountLabel;

@property (weak, nonatomic) IBOutlet UIView *starContainerView;
@property (nonatomic) BOOL starredState;
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
- (IBAction)onStarTouchUp:(id)sender;
- (IBAction)onStarTouchDown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *starCountLabel;

- (IBAction)onVideoPlayerTouchUp:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *pinButton;

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *linkLabel;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Main";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_main"];
        
        //self.navigationItem.title = @"Pintube";
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
        
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        
        self.likedState = NO;
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage *leftButtonImage = [[UIImage imageNamed:@"button_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIImage *rightButtonImage = [[UIImage imageNamed:@"button_share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(doNothing)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.cardView.layer.cornerRadius = 2;
    self.cardView.layer.masksToBounds = NO;
   
    self.cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cardView.layer.shadowOpacity = 0.2;
    self.cardView.layer.shadowOffset = CGSizeMake(0,1);
    self.cardView.layer.shadowRadius = 1;
    
    self.videoView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.videoView.layer.shadowOpacity = 0.2;
    self.videoView.layer.shadowOffset = CGSizeMake(0,1);
    self.videoView.layer.shadowRadius = 1;
    
    self.profileView.layer.cornerRadius = 15;
    
    self.commentView.frame = CGRectMake(0, 409, self.commentView.frame.size.width, self.commentView.frame.size.height);
    
    self.commentTextField.delegate = self;
    
    [self.pinButton setImage:[UIImage imageNamed:@"pin_btn_highlighted"] forState:UIControlStateHighlighted];

    //self.linkLabel.font = [UIFont systemFontOfSize: 12];
    //self.linkLabel.textColor = [UIColor lightGrayColor];
    //self.linkLabel.numberOfLines = 0;
    
    //self.linkLabel.delegate = self.linkLabel;
    //self.linkLabel.text = @"Added 2 days ago from youtube.com";
    //NSRange range = [self.linkLabel.text rangeOfString:@"youtube"];
    //[self.linkLabel addLinkToURL:[NSURL URLWithString:@"http://www.youtube.com"] withRange:range];
}

- (void)doNothing {
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.commentTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.commentView.frame = CGRectMake(0, 504 - kbSize.height - self.commentView.frame.size.height, self.commentView.frame.size.width, self.commentView.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.commentView.frame = CGRectMake(0, self.view.frame.size.height - self.commentView.frame.size.height, self.commentView.frame.size.width, self.commentView.frame.size.height);
                     }
                     completion:nil];
}

- (IBAction)onLikeTouchUp:(id)sender {
    if (self.likedState == NO) {
        self.likeImageView.image = [UIImage imageNamed:@"action_like_red"];
        self.likedState = YES;

        float likeCountNumber = [self.likeCountLabel.text floatValue] + 1;
        self.likeCountLabel.text = [NSString stringWithFormat:@"%0.0f", likeCountNumber];
        self.likeCountLabel.textColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    } else {
        self.likeImageView.image = [UIImage imageNamed:@"action_like"];
        self.likedState = NO;
        
        float likeCountNumber = [self.likeCountLabel.text floatValue] - 1;
        self.likeCountLabel.text = [NSString stringWithFormat:@"%0.0f", likeCountNumber];
        self.likeCountLabel.textColor = [UIColor colorWithRed:(182/255.0) green:(182/255.0) blue:(182/255.0) alpha:1];
    }
    
    self.likeContainerView.backgroundColor = [UIColor whiteColor];
}

- (IBAction)onLikeTouchDown:(id)sender {
    self.likeContainerView.backgroundColor = [UIColor colorWithRed:(200/255.0) green:(200/255.0) blue:(200/255.0) alpha:0.2];
}

- (IBAction)onHeartTouchUp:(id)sender {
    if (self.heartedState == NO) {
        self.heartImageView.image = [UIImage imageNamed:@"action_heart_red"];
        self.heartedState = YES;
        
        float heartCountNumber = [self.heartCountLabel.text floatValue] + 1;
        self.heartCountLabel.text = [NSString stringWithFormat:@"%0.0f", heartCountNumber];
        self.heartCountLabel.textColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    
    } else {
        self.heartImageView.image = [UIImage imageNamed:@"action_heart"];
        self.heartedState = NO;
    
        float heartCountNumber = [self.heartCountLabel.text floatValue] - 1;
        self.heartCountLabel.text = [NSString stringWithFormat:@"%0.0f", heartCountNumber];
        self.heartCountLabel.textColor = [UIColor colorWithRed:(182/255.0) green:(182/255.0) blue:(182/255.0) alpha:1];
    }
    
    self.heartContainerView.backgroundColor = [UIColor whiteColor];
}

- (IBAction)onHeartTouchDown:(id)sender {
    self.heartContainerView.backgroundColor = [UIColor colorWithRed:(200/255.0) green:(200/255.0) blue:(200/255.0) alpha:0.2];
}

- (IBAction)onStarTouchUp:(id)sender {
    if (self.starredState == NO) {
        self.starImageView.image = [UIImage imageNamed:@"action_star_red"];
        self.starredState = YES;
        
        float starCountNumber = [self.starCountLabel.text floatValue] + 1;
        self.starCountLabel.text = [NSString stringWithFormat:@"%0.0f", starCountNumber];
        self.starCountLabel.textColor = [UIColor colorWithRed:(199/255.0) green:(37/255.0) blue:(39/255.0) alpha:1];
    } else {
        self.starImageView.image = [UIImage imageNamed:@"action_star"];
        self.starredState = NO;
        
        float starCountNumber = [self.starCountLabel.text floatValue] - 1;
        self.starCountLabel.text = [NSString stringWithFormat:@"%0.0f", starCountNumber];
        self.starCountLabel.textColor = [UIColor colorWithRed:(182/255.0) green:(182/255.0) blue:(182/255.0) alpha:1];
    }
    
    self.starContainerView.backgroundColor = [UIColor whiteColor];
}

- (IBAction)onStarTouchDown:(id)sender {
    self.starContainerView.backgroundColor = [UIColor colorWithRed:(200/255.0) green:(200/255.0) blue:(200/255.0) alpha:0.2];
}

- (IBAction)onVideoPlayerTouchUp:(id)sender {
    PlayerViewController *vc = [[PlayerViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:vc animated:YES completion:nil];
}
@end
