//
//  User.h
//  PunchQuestApp
//
//  Created by Joanne Kwan on 2013-11-16.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
    NSString *location;
    NSString *activity;
    int numPeople;
}

@property NSString *location, *activity;
@property int numPeople;

@end
