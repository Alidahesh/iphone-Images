//
//  ViewController.m
//  Iphone Images
//
//  Created by Ali Dahesh on 2016-11-21.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iphoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        
        NSURL *url = [NSURL URLWithString: @"http://imgur.com/CoQ8aNl"];
        NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSLog(@"%@", data);
            if(error){
                NSLog(@"error: %@", error.localizedDescription);
                return;
            }
            NSError *jsonError = nil;
            NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError){
                
                NSLog(@"jsonError:%@", jsonError.localizedDescription);
                return;
            }
            
            data = [NSData dataWithContentsOfURL:@"http://imgur.com/CoQ8aNl"];
            UIImage *image = [UIImage imageWithData:data];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
             }];
            
            self.iphoneImageView.image = image;
                            
    }];
        
        [dataTask resume];
        
        
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
