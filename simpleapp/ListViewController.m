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

@property (nonatomic, strong) NSURLSessionConfiguration *configuration;
@property (nonatomic, strong) AFURLSessionManager *manager;
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) NSURLRequest *request;
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChuckNorrisApi];
    [self requestChuckNorrisApi];
}

- (IBAction)btnRequestLegendClick:(id)sender {
    [self requestChuckNorrisApi];
}

- (void)setupChuckNorrisApi {
    self.configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:self.configuration];
    
    self.URL = [NSURL URLWithString:@"https://api.chucknorris.io/jokes/random"];
    self.request = [NSURLRequest requestWithURL:self.URL];
}

- (void)requestChuckNorrisApi {
    self.dataTask = [self.manager dataTaskWithRequest:self.request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            ChuckNorrisResponse *chuckNorris = [ChuckNorrisResponse alloc];
            [chuckNorris parseResponse:responseObject];
            self.lblChuckNorrisSaying.text = chuckNorris.value;
        }
    }];
    
    [self.dataTask resume];
}

@end
