//
//  ListViewController.m
//  simpleapp
//
//  Created by Igor Maia Romcy on 16/05/19.
//  Copyright © 2019 igorromcy. All rights reserved.
//

#import "ListViewController.h"
#import "ChuckNorrisResponse.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLSessionManager.h>

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://api.chucknorris.io/jokes/random"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            ChuckNorrisResponse *chuckNorris = [ChuckNorrisResponse alloc];
            [chuckNorris parseResponse:responseObject];
            NSLog(@"%@ %@", response, chuckNorris);
        }
    }];
    
    [dataTask resume];

}
    
@end
