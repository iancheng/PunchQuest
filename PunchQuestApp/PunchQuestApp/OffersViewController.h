//
//  DetailViewController.h
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "TPGestureTableViewCell.h"
#import "User.h"
#import <UIKit/UIKit.h>

@interface OffersViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,TPGestureTableViewCellDelegate>
@property (strong, nonatomic) User *user;
@end
