//
//  RequestLocation.h
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestLocationViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    NSMutableArray *dataArray;
}

@property (weak, nonatomic) IBOutlet UIPickerView *locationPicker;

@end
