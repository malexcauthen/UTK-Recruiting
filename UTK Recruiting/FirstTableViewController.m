//
//  FirstTableViewController.m
//  UTK Recruiting
//
//  Created by Alex Cauthen on 7/1/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import "FirstTableViewController.h"
#import "singletonClass.h"

@interface FirstTableViewController ()

@end

@implementation FirstTableViewController

UIGestureRecognizer *tapper;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
    singletonClass *mySingleton = [singletonClass sharedsingletonClass];
    mySingleton.arrayLabels = [NSMutableArray arrayWithObjects: _nameLabel, _emailLabel, _phoneLabel, _termLabel, _schoolLabel, _graduationLabel, _gpaLabel, _degreeLabel, _interestLabel, _groupLabel, _appliedLabel, nil];
    
    mySingleton.arrayHeaders = [NSMutableArray arrayWithObjects: _eventName, _dateLocationName, nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 0;
}
*/
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}


     
- (IBAction)saveFormButton:(id)sender {
    singletonClass *mySingleton = [singletonClass sharedsingletonClass];
    
    // used to determine if required text field is empty
    NSInteger isTextFieldEmpty = 0;
    
    // array of labels found in view
    
    
    // array of text fields found in view
    NSArray *arrayOfTextFields = [NSArray arrayWithObjects: _nameTextfield, _emailTextfield, _phoneTextfield, _termTextfield, _schoolTextfield, _graduationTextfield, _gpaTextfield, _degreeTextfield, _interestTextfield, _groupTextfield, _appliedTextfield, nil];
    
    // alert if user did not enter all required fields
    UIAlertController * requiredAlert=   [UIAlertController
                                          alertControllerWithTitle:@"Usage Error"
                                          message:@"Please fill out the required fields!"
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    // alert when user sumbits form correctly
    UIAlertController * submittedAlert=   [UIAlertController
                                           alertControllerWithTitle:@"Submitted"
                                           message:@"Thank you for your submission!"
                                           preferredStyle:UIAlertControllerStyleAlert];
    
    // creates Ok button to dismiss alert
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    for (int i = 0; i < [mySingleton.arrayLabels count]; i++) {
        
        NSString *lastChar = [((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text substringFromIndex:[((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text length] - 1];
        NSLog(@"%@", lastChar);
        
        if ([((UITextField*)[arrayOfTextFields objectAtIndex:i]).text isEqualToString:@""] && [lastChar isEqualToString:@"*"]) {
            [((UITextField*)[arrayOfTextFields objectAtIndex:i]) setBackgroundColor:[UIColor colorWithRed:253.0f/255.0f green:233.0f/255.0f blue:221.0f/255.0f alpha:1]];
            ((UITextField*)[arrayOfTextFields objectAtIndex:i]).layer.cornerRadius = 6;
            
            isTextFieldEmpty = 1;
            
        }
        
        else if (![((UITextField*)[arrayOfTextFields objectAtIndex:i]).text isEqualToString:@""] && [lastChar isEqualToString:@"*"])
        {
            [((UITextField*)[arrayOfTextFields objectAtIndex:i]) setBackgroundColor:[UIColor whiteColor]];
            isTextFieldEmpty = 0;
        }
    }
    
    // print out message saying required fields need to be entered
    if (isTextFieldEmpty == 1)
    {
        [requiredAlert addAction:defaultAction];
        [self presentViewController:requiredAlert animated:YES completion:nil];
    }
    
    else
    {
        
        // saves text field data in comma separated CSV file format
        NSString *formData = [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@\n",
                              self.nameTextfield.text, self.emailTextfield.text,
                              self.phoneTextfield.text, self.termTextfield.text,
                              self.schoolTextfield.text, self.graduationTextfield.text,
                              self.gpaTextfield.text, self.degreeTextfield.text,
                              self.interestTextfield.text, self.groupTextfield.text,
                              self.appliedTextfield.text];
        
        // get document directory path
        NSString *documentDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                               NSUserDomainMask, YES)objectAtIndex:0];
        NSString *csv = @".csv";
        NSString *filename = [NSString stringWithFormat:@"%@%@", _eventName.text, csv];
        // append results.csv onto doc path
        NSString *event = [documentDirectoryPath stringByAppendingPathComponent:filename];
        
        // creates folder if it does not exist
        if (![[NSFileManager defaultManager] fileExistsAtPath:event]) {
            [[NSFileManager defaultManager] createFileAtPath:event contents:nil attributes:nil];
        }
        
        mySingleton.myFileName = filename; 
        mySingleton.filePath = event;
        
        
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:event];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[formData dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
        
        // clears form data
        self.nameTextfield.text=@"";
        self.emailTextfield.text=@"";
        self.phoneTextfield.text=@"";
        self.termTextfield.text=@"";
        self.schoolTextfield.text=@"";
        self.graduationTextfield.text=@"";
        self.gpaTextfield.text=@"";
        self.degreeTextfield.text=@"";
        self.interestTextfield.text=@"";
        self.groupTextfield.text=@"";
        self.appliedTextfield.text=@"";
        
        [submittedAlert addAction:defaultAction];
        [self presentViewController:submittedAlert animated:YES completion:nil];
        
        // runs if info was saved
        NSLog(@"Info Saved");
        NSLog(@"Documents Directory: %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                                  inDomains:NSUserDomainMask] lastObject]);
    }

}
@end
