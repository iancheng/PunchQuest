//
//  RequestDetailsViewController.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "RequestDetailsViewController.h"
#define PICKER_MIN 1
#define PICKER_MAX 20

@implementation RequestDetailsViewController

@synthesize user;


#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
//    return [dataArray count];
    
    return (PICKER_MAX-PICKER_MIN+1);
}

#pragma mark - UIPickerView Delegate
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//    return 30.0;
//}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d", (row+PICKER_MIN)];
    //return [dataArray objectAtIndex:row];
}


- (void)viewDidLoad {
    
//    dataArray = [[NSMutableArray alloc] init];
//    
//    for(int i=1; i<=20; ++i) {
//        [dataArray addObject:[NSDecimalNumber numberWithInt:i]];
//    }
    
    [self groupNumberPicker].delegate = self;
    [self groupNumberPicker].dataSource = self;
    
    [self activityLabel].text = [user getActivity];
    [self locationLabel].text = [user getLocation];
    
    
}

- (IBAction)sendRequestPressed:(UIButton *)sender {
}
@end
