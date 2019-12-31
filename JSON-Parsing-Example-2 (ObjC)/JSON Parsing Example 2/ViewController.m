//
//  ViewController.m
//  JSON Parsing Example 2
//
//  Created by Mallikarjun on 11/10/18.
//  Copyright © 2018 Mallikarjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


- (IBAction)buttonClicked:(id)sender {
    
    NSString *sampleUrl = @"http://182.72.79.154/iphonetest/getTheData.php";
    
    NSCharacterSet *set= [NSCharacterSet URLQueryAllowedCharacterSet];
    
    NSString * encodedURL = [sampleUrl stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:encodedURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError * jsonError;
        
        id jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSLog(@"JSON Response is: %@",jsonResponse);
        
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self->_textViewInstance.text = [NSString stringWithFormat:@"%@",jsonResponse];
                
            });
            
        });
        
    }]resume];
    
}
@end
