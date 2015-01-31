//
//  MyDataFetchClass.m
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import "MyDataFetchClass.h"

@implementation MyDataFetchClass
//once this is finished, call completionBlock in main thread.  Pass in type.
-(void)fetchOpenIssues:(NSString*)state completion:(void (^)(NSMutableArray *myIssueData))completionBlock
{
    __block NSMutableArray *issueData; //block-safe
    
    //code here should be run in a background thread. Your main thread should not be blocked.
    //network CODE goes here (NSURLSession code).
    
    /* Download all open issues using GitHub API */
    
    // GitHub API url
    NSString *url = [@"https://api.github.com/repos/uchicago-mobi/2015-Winter-Forum/issues?state=" stringByAppendingString:state];
    
    // Create NSUrlSession
    NSURLSession *session = [NSURLSession sharedSession];
    
    //the moment you hit this block, this spawns a background thread - so it can download concurrently at its own pace
    // Create data download taks
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
                
                NSError *jsonError;
                issueData = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingAllowFragments
                                                                   error:&jsonError];
                // Log the data for debugging
                NSLog(@"DownloadedData:%@",issueData);
                
                //now you're done with your background thread - switch BACK to main thread (queue) to update UI
                // Use dispatch_async to update the table on the main thread
                // Remember that NSURLSession is downloading in the background
                dispatch_async(dispatch_get_main_queue(), ^{
                    //send issueData to completionBlock
                    completionBlock(issueData);
                });
            }] resume];
    
    
}

@end
