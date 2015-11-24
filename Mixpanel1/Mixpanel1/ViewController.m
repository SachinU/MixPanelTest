//
//  ViewController.m
//  Mixpanel1
//
//  Created by SachinU on 24/11/15.
//  Copyright © 2015 SachinU. All rights reserved.
//

#import "ViewController.h"
#define MIXPANEL_TOKEN @"9e35c017e7fc5e5ab5da8b30d7c86b31"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize the library with your
    // Mixpanel project token, MIXPANEL_TOKEN
    [Mixpanel sharedInstanceWithToken:MIXPANEL_TOKEN];
    
    Mixpanel *mixpanel = [Mixpanel sharedInstance];
    
    [mixpanel timeEvent:@"Image Upload"];
    
    [self uploadImageWithSuccessHandler:^(bool flag){
        if(flag)
        {
            [mixpanel track:@"Image Upload"];
            self.imageView.image = [UIImage imageWithData:imgData];
        }else
            return;
    }];
    

}


//    [AppDelegate downloadDataFromURL:url withCompletionHandler:^(NSData *data) {

//+(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *))completionHandler{

-(void)uploadImageWithSuccessHandler:(void(^)(bool))completionHandler
{
    NSURL *url = [NSURL URLWithString:@"http://qa.eosadvantage.com/Uploads/185276_0_Save308DC523-937F-4B81-9451-E090C309D958.png"];
    imgData = [NSData dataWithContentsOfURL:url];
    completionHandler(YES);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
