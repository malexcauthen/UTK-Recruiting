//
//  SecondTableViewController.h
//  UTK Recruiting
//
//  Created by Alex Cauthen on 7/1/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UISegmentedControl *nameSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *emailSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *phoneSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *termSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *schoolSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *graduationSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gpaSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *degreeSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *interestSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *groupSegment;
@property (strong, nonatomic) IBOutlet UISegmentedControl *appliedSegment;


@property (strong, nonatomic) IBOutlet UITextField *eventNameField;
@property (strong, nonatomic) IBOutlet UITextField *locationDateField;

@property (nonatomic, retain) NSMutableArray *arrayOfSegments;
@property (nonatomic, retain) NSMutableArray *arrayOfHeaders;

- (IBAction)updateFormButton:(id)sender;

@end
