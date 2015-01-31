//
//  AllIssuesTableViewController.h
//  GitHubIssues
//
//  Created by ajchang on 1/28/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IssueTableViewCell.h"

@interface AllIssuesTableViewController : UITableViewController

@property (strong,nonatomic) NSMutableArray *issueData;

@end
