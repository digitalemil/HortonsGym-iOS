//
//  NewsPrivacyViewController.m
//  Horton's Gym
//
//  Created by Emil on 29/04/15.
//  Copyright (c) 2015 digitalemil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsPrivacyViewController.h"
NewsPrivacyViewController *npc;

@interface NewsPrivacyViewController ()
@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation NewsPrivacyViewController

- (void)news{
    [self.navbar setTitle:@"News"];
    NSURL *url = [NSURL URLWithString:@"http://digitalemil.de/hortonsgym/news.html"];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
}

- (void)installation{
    [self.navbar setTitle:@"Installation on Mac"];
    NSURL *url = [NSURL URLWithString:@"http://digitalemil.de/hortonsgym/"];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
}

- (void)privacy{
    [self.navbar setTitle:@"Privacy Policy"];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"web/privacy.html" ofType:nil];
    self.webview.scalesPageToFit= YES;

    [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
}

- (void)backTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.navbar setTitle:@""];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                        action:@selector(backTapped:)];
    
    self.navbar.leftBarButtonItem = back;
    
    npc= self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
