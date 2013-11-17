//
//  RequestDetailsViewController.h
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "User.h"
#import <UIKit/UIKit.h>

@interface RequestDetailsViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSMutableArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *groupNumberPicker;
@property (strong, nonatomic) User *user;

- (IBAction)sendRequestPressed:(UIButton *)sender;

@end
