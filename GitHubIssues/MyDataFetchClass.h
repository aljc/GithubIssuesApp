//
//  MyDataFetchClass.h
//  GitHubIssues
//
//  Created by ajchang on 1/30/15.
//  Copyright (c) 2015 ajchang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDataFetchClass : NSObject
-(void)fetchOpenIssues:(NSString*)state completion:(void (^)(NSMutableArray *myIssueData))completionBlock;
@end
