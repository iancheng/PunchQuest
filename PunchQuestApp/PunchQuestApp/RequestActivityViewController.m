//
//  RequestActivityViewController.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "RequestActivityViewController.h"

#define phpLink @"http://www.rent2play.ca/testing/api/locations"

@implementation RequestActivityViewController

- (IBAction)activityPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"detailsSegue" sender:sender];
}

- (void)viewDidLoad
{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:phpLink]];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });

}

- (void)fetchedData:(NSData *)responseData {
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData //1
                     options:kNilOptions error:nil];
    
//    NSLog(@"json response: %@", json);
    
//    NSSortDescriptor *nameSorter = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
//    NSSortDescriptor *priceSorter = [[NSSortDescriptor alloc] initWithKey:@"distancesave" ascending:YES];
    
//    json = [json sortedArrayUsingDescriptors:[NSArray arrayWithObjects:nameSorter,priceSorter,nil]];
    
    // NSMutableArray *contattiTMP = [[NSMutableArray alloc] initWithCapacity:[json count]]; //2
    
//    int counter = 0;
//    NSMutableArray *json2 = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dict in json) { //3
        NSLog(@"array: %@", dict);
        
    }
}



@end
