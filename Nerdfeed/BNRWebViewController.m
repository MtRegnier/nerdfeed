//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by Dane on 9/3/15.
//  Copyright (c) 2015 Regnier Design. All rights reserved.
//

#import "BNRWebViewController.h"

@interface BNRWebViewController () 

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UIBarButtonItem *forwardButton;
@property (nonatomic, strong) UIBarButtonItem *backButton;

@end

@implementation BNRWebViewController

- (void)loadView
{
    self.webView = [[UIWebView alloc] init];
    self.webView.scalesPageToFit = YES;
    CGRect toolbarFrame = CGRectMake(0, 984, [[UIScreen mainScreen]bounds].size.width, 40);
    self.toolbar = [[UIToolbar alloc] initWithFrame:toolbarFrame];
    self.backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" 
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(goBackPage)];
    self.forwardButton = [[UIBarButtonItem alloc] initWithTitle:@"Forward"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(goForwardPage)];
    self.toolbar.items = @[self.backButton, self.forwardButton];
    
    [self.webView addSubview:self.toolbar];
    self.view = self.webView;
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

#pragma mark Toolbar Button Setup

- (void)goBackPage
{
    if (!self.webView.canGoBack) {
        return;
    }
    
    [self.webView goBack];
}

- (void)goForwardPage
{
    if (!self.webView.canGoForward) {
        return;
    }
    
    [self.webView goForward];
}

#pragma mark Split View Controller Setup

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    
}

@end
