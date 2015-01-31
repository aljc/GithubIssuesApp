//
//  CircleViewController.m
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "CircleViewController.h"
#import "MyDataFetchClass.h"

@interface CircleViewController ()

@property NSInteger open;
@property NSInteger closed;

@end

@implementation CircleViewController

- (void)updateLabels {
    self.openIssues.text = [NSString stringWithFormat:@"%ld open issues", self.open];
    self.closedIssues.text = [NSString stringWithFormat:@"%ld closed issues", self.closed];
}

- (void)countIssues {
    self.open = 0;
    
    for (NSDictionary *n in self.issueData)
    {
        if ([[n objectForKey:@"state"] isEqualToString:@"open"]) {
                self.open++;
        }
    }
    
    self.closed = [self.issueData count] - self.open;
    NSLog(@"open: %ld", _open);
    NSLog(@"closed: %ld", _closed);
    [self updateLabels];
}

- (void)loadInitialData {
    MyDataFetchClass *fetchData = [[MyDataFetchClass alloc] init];
    [fetchData fetchOpenIssues:@"all" completion:^(NSMutableArray *myIssueData) {
        
        if (myIssueData) {
            self.issueData = myIssueData;
            
            //success! Update UI here
            [self countIssues];
     
        }
        else{
            //something went wrong. no data?
            NSLog(@"Error: data not downloaded correctly");
         
        }
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.issueData = [[NSMutableArray alloc] init]; //initialize the array
    [self loadInitialData]; //now, populate the array!
    
    //note - can't update the labels here because if the block is running concurrently with this,
    //then we won't know our counts until the block is finished!  so must call updateLabels from the block itself.
  }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
