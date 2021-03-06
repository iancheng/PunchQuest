//
//  RequestActivityViewController.h
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "User.h"
#import <UIKit/UIKit.h>

@interface RequestActivityViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *activityButtonsCollection;
- (IBAction)activityPressed:(UIButton *)sender;
@property (strong, nonatomic) User *user;

@end
