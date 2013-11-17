//
//  RequestLocation.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "RequestLocationViewController.h"
#import "RequestActivityViewController.h"

@implementation RequestLocationViewController
- (User *)user {
    if(!user) {
        user = [[User alloc] init];
    }
    return user;
}

- (IBAction)nextPressed:(id)sender {
    int row = [[self locationPicker] selectedRowInComponent:0];
    [user setLocation:[dataArray objectAtIndex:row]];
    NSLog(@"location: %@", [user getLocation]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"RequestActivityView"]) {
        RequestActivityViewController *destViewController = segue.destinationViewController;
        destViewController.user = user;
    }
}



#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dataArray count];
}

#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [dataArray objectAtIndex:row];
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //Let's print in the console what the user had chosen;
//    NSLog(@"Chosen item: %@", [dataArray objectAtIndex:row]);
    
}

- (void)viewDidLoad {
    [self user];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.rent2play.ca/testing/api/locations"]];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
    

    
}

- (void)fetchedData:(NSData *)responseData {
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData //1
                     options:kNilOptions error:nil];
    
    dataArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *dict in json) {
        [dataArray addObject: [dict objectForKey:(@"name")]];
    }
    
    [self locationPicker].delegate = self;
    [self locationPicker].dataSource = self;
    
    
}

@end
