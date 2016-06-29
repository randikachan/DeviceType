//
//  ViewController.m
//  DeviceType
//
//  Created by Kasun Randika on 6/28/16.
//  Copyright © 2016 Kasun Randika. All rights reserved.
//

#import "ViewController.h"
#import "DeviceTypes.h"
#import "MethodCallResultTableViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@property (nonatomic, strong) NSArray *arrCallsAndResults;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initDataSource];
    NSLog(@"DeviceName: %@", [DeviceTypes deviceModelName]);
}

- (void)initDataSource {
    self.arrCallsAndResults = @[
                                @{@"call" : @"[DeviceTypes deviceModelName]",
                                  @"result" : [DeviceTypes deviceModelName]},
                                @{@"call" : @"[DeviceTypes isIPhone5SizedDevice]",
                                  @"result" : [self getYesOrNoString:[DeviceTypes isIPhone5SizedDevice]]},
                                @{@"call" : @"[DeviceTypes isIPhone6SizedDevice]",
                                  @"result" : [self getYesOrNoString:[DeviceTypes isIPhone6SizedDevice]]},
                                @{@"call" : @"[DeviceTypes isIPhone6PlusSizedDevice]",
                                  @"result" : [self getYesOrNoString:[DeviceTypes isIPhone6PlusSizedDevice]]},
                                @{@"call" : @"[DeviceTypes isIPad]",
                                  @"result" : [self getYesOrNoString:[DeviceTypes isIPad]]},
                                ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrCallsAndResults count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"TBVCMethodCallResult";
    MethodCallResultTableViewCell *methodCallResultTBVC = (MethodCallResultTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellId];
    if (methodCallResultTBVC == nil) {
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:cellId owner:nil options:nil];
        methodCallResultTBVC = [nibs objectAtIndex:0];
    }
    NSDictionary *cellData = [self.arrCallsAndResults objectAtIndex:indexPath.row];

    [methodCallResultTBVC.lblMethodCall setAttributedText:[self getAttributedStringForString:[cellData objectForKey:@"call"] fontColor:UIColorFromRGB(0x23FF83)]];
    [methodCallResultTBVC.lblMethodCallResult setAttributedText:[self getAttributedStringForString:[cellData objectForKey:@"result"] fontColor:UIColorFromRGB(0xD31895)]];

    return methodCallResultTBVC;
}

#pragma mark Util methods
- (NSString *) getYesOrNoString:(BOOL)flag {
    return flag ? @"YES" : @"NO";
}

- (NSAttributedString *) getAttributedStringForString:(NSString *)string fontColor:(UIColor *)fontColor {
    NSMutableAttributedString *str  = [[NSMutableAttributedString alloc] initWithString:string
                                                                                attributes:@{
                                                                                             NSFontAttributeName: [UIFont fontWithName:@"Menlo-Regular" size:14.0],
                                                                                             NSForegroundColorAttributeName: fontColor
                                                                                             }
                                          ];
    return str;
}


@end