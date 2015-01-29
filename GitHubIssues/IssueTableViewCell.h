//
//  IssueTableViewCell.h
//  GitHubIssues
//
//  Created by ajchang on 1/28/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssueTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;


@end
