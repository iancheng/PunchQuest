//
//  RequestActivityViewController.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "RequestActivityViewController.h"
#import "RequestDetailsViewController.h"

#define phpLink @"http://www.rent2play.ca/testing/api/activities"

@implementation RequestActivityViewController

@synthesize user;

- (IBAction)activityPressed:(UIButton *)sender {
    [self performSegueWithIdentifier:@"detailsSegue" sender:sender];
    [user setActivity:sender.currentTitle];
    NSLog(@"location: %@", [user getLocation]);
    NSLog(@"activity: %@", [user getActivity]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RequestDetailsViewController *destViewController = segue.destinationViewController;
    destViewController.user = user;
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
    
    NSString* baseURL = @"http://www.rent2play.ca/testing/images/";
    
    for(int i=0;i<[[self activityButtonsCollection] count];i++) {
        UIButton *button = [[self activityButtonsCollection] objectAtIndex:i];
        NSDictionary *dict = [json objectAtIndex:i];
        [button setTitle:[dict objectForKey:@"name"] forState:(UIControlStateNormal)];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        NSString* imgURL = [baseURL stringByAppendingString:[dict objectForKey:(@"imgURL")]];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]]];
        
        [button setImage:image forState:(UIControlStateNormal)];
        
    }
}



@end
