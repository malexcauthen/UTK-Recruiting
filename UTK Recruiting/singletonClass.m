//
//  singletonClass.m
//  UTK Recruiting
//
//  Created by Alex Cauthen on 8/4/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import "singletonClass.h"

@implementation singletonClass
@synthesize arrayLabels;
@synthesize arrayHeaders;
@synthesize filePath;
@synthesize myFileName;

static singletonClass *sharedsingletonClass = nil;
+(singletonClass*) sharedsingletonClass {
    @synchronized(self) {
        if (sharedsingletonClass == nil) {
            sharedsingletonClass = [[self alloc] init];
        }
    }
    return sharedsingletonClass;
}
@end
