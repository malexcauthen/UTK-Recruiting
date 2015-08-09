//
//  singletonClass.h
//  UTK Recruiting
//
//  Created by Alex Cauthen on 8/4/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singletonClass : NSObject {
    NSMutableArray *arrayLabels;
    NSMutableArray *arrayHeaders;
    NSString *filePath;
    NSString *myFileName;
}

@property NSMutableArray* arrayLabels;
@property NSMutableArray* arrayHeaders;
@property NSString* filePath;
@property NSString* myFileName;

+(singletonClass*) sharedsingletonClass;

@end
