//
//  dataClass.h
//  UTK Recruiting
//
//  Created by Alex Cauthen on 8/4/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dataClass : NSObject {
    NSMutableArray *arrayOfLabels;
}

@property(nonatomic,retain) NSMutableArray *arrayOfLabels;
+(dataClass*)getInstance;

@end
