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

//@property (weak, nonatomic) IBOutlet UILabel *detailTitle;
//@property (weak, nonatomic) IBOutlet UILabel *detailDate;
//@property (weak, nonatomic) IBOutlet UILabel *detailAuthor;
//@property (weak, nonatomic) IBOutlet UIImageView *detailStatusImage;

@end
