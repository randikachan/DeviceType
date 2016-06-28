//
//  ViewController.m
//  DeviceType
//
//  Created by Kasun Randika on 6/28/16.
//  Copyright © 2016 Kasun Randika. All rights reserved.
//

#import "ViewController.h"
#import "DeviceTypes.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"DeviceName: %@", [DeviceTypes deviceModelName]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
