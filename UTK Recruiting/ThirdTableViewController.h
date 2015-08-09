//
//  ThirdTableViewController.h
//  UTK Recruiting
//
//  Created by Alex Cauthen on 7/1/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ThirdTableViewController : UITableViewController<MFMailComposeViewControllerDelegate>

- (IBAction)sendEmailButton:(id)sender;


@end
