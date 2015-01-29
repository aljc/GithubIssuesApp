//
//  AllIssuesTableViewController.m
//  GitHubIssues
//
//  Created by ajchang on 1/28/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "AllIssuesTableViewController.h"
#import "IssueTableViewCell.h"

@interface AllIssuesTableViewController ()

@end

@implementation AllIssuesTableViewController

- (void)loadInitialData {
    /* Download all open issues using GitHub API */
    
    // GitHub API url
    NSString *url = @"https://api.github.com/repos/uchicago-mobi/2015-Winter-Forum/issues?state=all";
    
    // Create NSUrlSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    // Create data download taks
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                
                NSError *jsonError;
                self.issueData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&jsonError];
                // Log the data for debugging
                NSLog(@"DownloadeData:%@",self.issueData);
                
                // Use dispatch_async to update the table on the main thread
                // Remember that NSURLSession is downloading in the background
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }] resume];
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
    
    //Reload the table
    [self.tableView reloadData];
    
    //Stop the spinner
    [self.refreshControl endRefreshing];
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
    IssueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IssueTableCell" forIndexPath:indexPath];
    
    // Configure the cell...
    //need to parse issueData array now and populate the cell's custom title, author, date, and status image properties!
    cell.title.text = @"hiiii";
    cell.author.text = @"author";
    cell.date.text = @"1/1/1111";
    [cell.statusImage setImage:[UIImage imageNamed:@"red.png"]];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
