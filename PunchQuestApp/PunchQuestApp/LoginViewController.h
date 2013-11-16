//
//  LoginViewController.h
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *LoginStatusLabel;
@property (weak, nonatomic) IBOutlet UITextView *tokenLabel;

- (IBAction)buttonClickHandler:(id)sender;
- (IBAction)showTokenClicked:(UIButton *)sender;

@end
