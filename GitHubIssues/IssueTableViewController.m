//
//  IssueTableViewController.m
//  GitHubIssues
//
//  Created by ajchang on 1/28/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "IssueTableViewController.h"
#import "IssueTableViewCell.h"
#import "MyDataFetchClass.h"
#import "IssueDetailViewController.h"

@interface IssueTableViewController ()

@end

@implementation IssueTableViewController

- (void)loadInitialData {
    MyDataFetchClass *fetchData = [[MyDataFetchClass alloc] init];
    [fetchData fetchOpenIssues:@"open" completion:^(NSMutableArray *myIssueData) {
        
        if (myIssueData) {
            self.issueData = myIssueData;
            
            //success! Update UI here
            [self.tableView reloadData];
            
            //Stop the spinner
            [self.refreshControl endRefreshing];
        }
        else{
            //something went wrong. no data?
            NSLog(@"Error: data not downloaded correctly");
            
            //Stop the spinner
            [self.refreshControl endRefreshing];
        }
    }];
  }

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.issueData = [[NSMutableArray alloc] init]; //initialize the array
    [self loadInitialData]; //now, populate the array!
    
    
    
    //Refresh Controller for this table view controller
    UIRefreshControl *pullToRefresh = [[UIRefreshControl alloc] init];
    [pullToRefresh addTarget:self action:@selector(refreshTable)
            forControlEvents:UIControlEventValueChanged];
    self.refreshControl = pullToRefresh;

}

- (void)refreshTable {
    NSLog(@"Pull To Refresh");
    
    //Reload the data - repopulate the issuesData array! ***
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.issueData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Note: We are using a CUSTOM cell!
    IssueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IssueTableCell" forIndexPath:indexPath];
    
    //need to parse issueData array now and populate the cell's custom title, author, date, and status image properties!
    id currentArrayElement = [self.issueData objectAtIndex:indexPath.row];
    
    //NSLog(@"array: %@", [self.issueData objectAtIndex:indexPath.row]);
    cell.title.text = [currentArrayElement objectForKey:@"title"];
    cell.author.text = [[currentArrayElement objectForKey:@"user"] objectForKey:@"login"];
    cell.date.text = [[currentArrayElement objectForKey:@"created_at"] substringToIndex:10];
    
    NSString *state = [currentArrayElement objectForKey:@"state"];

    //issue is open
    if ([state isEqualToString: @"open"]) {
        [cell.statusImage setImage:[UIImage imageNamed:@"green.png"]];
    }
    //issue is closed
    else {
        [cell.statusImage setImage:[UIImage imageNamed:@"red.png"]];
    }
    
    cell.URL = [currentArrayElement objectForKey:@"html_url"];
       
    // Configure the cell...
    
    return cell;
}

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    IssueDetailViewController *dest = [segue destinationViewController];
    dest.tappedCell = (IssueTableViewCell *)sender;
    NSLog(@"tapped cell: %@", dest.tappedCell.title.text);
}

@end
