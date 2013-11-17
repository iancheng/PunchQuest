//
//  RequestDetailsViewController.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "RequestDetailsViewController.h"
#import "OffersViewController.h"
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
    int row = [[self groupNumberPicker] selectedRowInComponent:0];
    NSLog(@"numPeople: %d", row+PICKER_MIN);
    [user setNumPeople: row+PICKER_MIN];
    
    NSString *requestURL = [NSString stringWithFormat: @"http://www.rent2play.ca/testing/api/requests/add/Simon/%@/%@/%@", [user getLocation], [user getActivity], [NSString stringWithFormat:@"%d", [user getNumPeople]]];
    
    requestURL = [requestURL stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//    NSLog(requestURL);
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:requestURL]];
//        [self performSelectorOnMainThread:@selector(fetchedData:)
//                               withObject:data waitUntilDone:YES];
//    });
    
    
    [self performSegueWithIdentifier:@"offersSegue" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OffersViewController *destViewController = segue.destinationViewController;
    destViewController.user = user;
}

- (void)fetchedData:(NSData *)responseData {
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData //1
                     options:kNilOptions error:nil];
    NSLog(@"json: %@", json);
    
    for(NSDictionary *dict in json) {
        [user setRequestID: [[dict objectForKey:(@"id")] intValue]];
    }
    
    NSLog(@"requestID: %d", [user getRequestID]);
    
}

@end
