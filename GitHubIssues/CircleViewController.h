//
//  CircleViewController.h
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleViewController : UIViewController

@property (strong,nonatomic) NSMutableArray *issueData;
@property (weak, nonatomic) IBOutlet UILabel *openIssues;
@property (weak, nonatomic) IBOutlet UILabel *closedIssues;

@end
