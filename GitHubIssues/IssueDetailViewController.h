//
//  IssueDetailViewController.h
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IssueTableViewCell.h"

@interface IssueDetailViewController : UIViewController

@property (strong,nonatomic) IssueTableViewCell *tappedCell;

@property (weak, nonatomic) IBOutlet UITextView *titleText;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;


@end
