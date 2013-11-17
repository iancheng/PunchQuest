//
//  RequestDetailsViewController.h
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *groupNumberPicker;

- (IBAction)sendRequestPressed:(UIButton *)sender;

@end
