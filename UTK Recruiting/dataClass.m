//
//  dataClass.m
//  UTK Recruiting
//
//  Created by Alex Cauthen on 8/4/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import "dataClass.h"

@implementation dataClass
@synthesize arrayOfLabels;

static dataClass *instance = nil;

+(dataClass*)getInstance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [dataClass new];
        }
    }
    return instance;
}

@end
