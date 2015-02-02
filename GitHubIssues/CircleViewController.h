//
//  CircleViewController.h
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawCircle.h"

@interface CircleViewController : UIViewController

@property (strong,nonatomic) NSMutableArray *issueData;
@property (weak, nonatomic) IBOutlet UILabel *openIssues;
@property (weak, nonatomic) IBOutlet UILabel *closedIssues;
@property NSInteger open;
@property NSInteger closed;
//**Note: must set our view as an outlet to the view controller in order to pass open and closed values to the view!
@property (strong, nonatomic) IBOutlet DrawCircle *customView;

@end
