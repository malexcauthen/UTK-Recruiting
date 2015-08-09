//
//  SecondTableViewController.m
//  UTK Recruiting
//
//  Created by Alex Cauthen on 7/1/15.
//  Copyright (c) 2015 malexcauthen. All rights reserved.
//

#import "SecondTableViewController.h"
#import "singletonClass.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController

UIGestureRecognizer *tapper2;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    tapper2 = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper2.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper2];
    
    _arrayOfSegments = [NSMutableArray arrayWithObjects:_nameSegment, _emailSegment, _phoneSegment, _termSegment, _schoolSegment, _gpaSegment, _gpaSegment, _degreeSegment, _interestSegment, _groupSegment, _appliedSegment, nil];
    
    _arrayOfHeaders = [NSMutableArray arrayWithObjects:_eventNameField, _locationDateField, nil];
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
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

- (IBAction)updateFormButton:(id)sender {


    singletonClass *mySingleton = [singletonClass sharedsingletonClass];
    NSString *required = @" *";
    
    for (int i = 0; i < [_arrayOfHeaders count]; i++) {
        if (![((UITextField*)[_arrayOfHeaders objectAtIndex:i]).text isEqualToString:@""]) {
            ((UITextField*)[mySingleton.arrayHeaders objectAtIndex:i]).text = ((UITextField*)[_arrayOfHeaders objectAtIndex:i]).text;
        }
    }
    
    for (int i = 0; i < [_arrayOfSegments count]; i++){
        
        NSString *lastChar = [((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text substringFromIndex:[((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text length] - 1];
        
        // 0 = required
        if (((UISegmentedControl*)[_arrayOfSegments objectAtIndex:i]).selectedSegmentIndex == 0) {
            
            if (![lastChar isEqualToString:@"*"]) {
                ((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text = [NSString stringWithFormat:@"%@%@", ((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text, required];
            }
        }
        
        // 1 = not required
        else {
            if ([lastChar isEqualToString:@"*"]) {
                ((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text = [((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text substringToIndex:[((UITextField*)[mySingleton.arrayLabels objectAtIndex:i]).text length] - 2];
            }
        }
        
        
    }
     
}
                 
@end


