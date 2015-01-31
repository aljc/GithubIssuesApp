//
//  IssueDetailViewController.m
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "IssueDetailViewController.h"

@interface IssueDetailViewController ()

@end

@implementation IssueDetailViewController


- (IBAction)showIssueDetail:(UIStoryboardSegue *)segue {
    
    //self.detailTitle.text = self.tappedCell.title.text;
    //self.detailAuthor.text = [self.tappedCell.author.text stringByAppendingString:@" opened this issue"];
    //self.detailDate.text = self.tappedCell.date.text;
    //self.detailStatusImage = self.tappedCell.statusImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)openInSafari:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.tappedCell.URL]];
}

@end
