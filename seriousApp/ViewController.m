//
//  ViewController.m
//  seriousApp
//
//  Created by Ariel Robles on 2/9/15.
//  Copyright (c) 2015 nearsoft. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getAndPrint:(id)sender {
    //http://www.telize.com/geoip
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://www.telize.com/geoip" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString * print = [NSString stringWithFormat:@"\n area code: %@ \n asn: %@ \n continent code: %@ \n country: %@ \n country code: %@ country code3: %@ \n dma code: %@ \n ip: %@ \n isp: %@ \n latitude: %@ \n longitude: %@",
                            [responseObject objectForKey: @"area_code"],
                            [responseObject objectForKey: @"asn"],
                            [responseObject objectForKey: @"continent_code"],
                            [responseObject objectForKey: @"country"],
                            [responseObject objectForKey: @"country_code"],
                            [responseObject objectForKey: @"country_code3"],
                            [responseObject objectForKey: @"dma_code"],
                            [responseObject objectForKey: @"ip"],
                            [responseObject objectForKey: @"isp"],
                            [responseObject objectForKey: @"latitude"],
                            [responseObject objectForKey: @"longitude"]
                            ];
        
        NSLog(@"%@",print);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
@end
