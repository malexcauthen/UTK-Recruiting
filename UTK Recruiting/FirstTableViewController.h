//
//  FirstTableViewController.h
//  UTK Recruiting
//
//  Created by Alex Cauthen on 7/1/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface FirstTableViewController : UITableViewController

// Recruiting form Textfield outlets
@property (strong, nonatomic) IBOutlet UITextField *nameTextfield;
@property (strong, nonatomic) IBOutlet UITextField *emailTextfield;
@property (strong, nonatomic) IBOutlet UITextField *phoneTextfield;
@property (strong, nonatomic) IBOutlet UITextField *termTextfield;
@property (strong, nonatomic) IBOutlet UITextField *schoolTextfield;
@property (strong, nonatomic) IBOutlet UITextField *graduationTextfield;
@property (strong, nonatomic) IBOutlet UITextField *gpaTextfield;
@property (strong, nonatomic) IBOutlet UITextField *degreeTextfield;
@property (strong, nonatomic) IBOutlet UITextField *interestTextfield;
@property (strong, nonatomic) IBOutlet UITextField *groupTextfield;
@property (strong, nonatomic) IBOutlet UITextField *appliedTextfield;

// Recruiting header labels
@property (strong, nonatomic) IBOutlet UILabel *eventName;
@property (strong, nonatomic) IBOutlet UILabel *dateLocationName;


// Recruiting form labels
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *termLabel;
@property (strong, nonatomic) IBOutlet UILabel *schoolLabel;
@property (strong, nonatomic) IBOutlet UILabel *graduationLabel;
@property (strong, nonatomic) IBOutlet UILabel *gpaLabel;
@property (strong, nonatomic) IBOutlet UILabel *degreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *interestLabel;
@property (strong, nonatomic) IBOutlet UILabel *groupLabel;
@property (strong, nonatomic) IBOutlet UILabel *appliedLabel;




// Recruiting form save button action
- (IBAction)saveFormButton:(id)sender;







// determines if text field is required



@end
