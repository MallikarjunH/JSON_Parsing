//
//  ViewController.m
//  JSON Parsing - Example 1
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
    
   //[self apiMethodCall];
}

-(void)apiMethodCall{
    
    NSString *sampleUrl = @"http://182.72.79.154/iphonetest/getTheData.php";
    
    NSURLRequest *request= [NSURLRequest requestWithURL:[NSURL URLWithString:sampleUrl]];
    
    NSURLResponse *resp =nil;
    NSError *error =nil;
    
    //Note:- 'sendSynchronousRequest:returningResponse:error:' is deprecated: first deprecated in iOS 9.0 - Solution is Use [NSURLSession dataTaskWithRequest:completionHandler:] (see NSURLSession.h)
    
    NSData *data = [NSURLConnection sendSynchronousRequest: request returningResponse: &resp error: &error];
    
    //NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //  NSLog(@"%@",responseString);
    
    // use following method if you do not know json type
    id responseData =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"id resp: %@",responseData);
    
    /*   //OR use this if your response
     NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
     NSLog(@"%@",jsonResponse);
     
     */
    
    _textViewInstance.text= [NSString stringWithFormat:@"%@",responseData];
    
}


- (IBAction)buttonClicked:(id)sender {
    
    [self apiMethodCall];
    
}
@end
