//
//  User.m
//  PunchQuestApp
//
//  Created by Joanne Kwan on 2013-11-16.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "User.h"

@implementation User

- (void)setLocation:(NSString *)loc {
    location = loc;
}
- (NSString*)getLocation {
    return location;
}

- (void)setActivity:(NSString *)act {
    activity = act;
}
- (NSString*)getActivity {
    return activity;
}

- (void)setNumPeople:(int)num {
    numPeople = num;
}
- (int)getNumPeople {
    return numPeople;
}

- (void)setRequestID:(int)num {
    requestID = num;
}
- (int)getRequestID {
    return requestID;
}


@end
