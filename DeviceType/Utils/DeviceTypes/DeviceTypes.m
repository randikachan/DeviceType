//
//  DeviceTypes.m
//  DeviceType
//
//  Created by Kasun Randika on 6/28/16.
//  Copyright © 2016 Kasun Randika. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Kasun Randika
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "DeviceTypes.h"
#import <sys/utsname.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation DeviceTypes

/*
 * Retrieves back the device name or if not the machine name.
 */
+ (NSString*)deviceModelName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machineName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //MARK: More official list is at
    //http://theiphonewiki.com/wiki/Models
    //MARK: You may just return machineName. Following is for convenience
    
    NSDictionary *commonNamesDictionary =
    @{
      @"i386":     @"i386 Simulator",
      @"x86_64":   @"x86_64 Simulator",
      
      @"iPhone1,1":    @"iPhone",
      @"iPhone1,2":    @"iPhone 3G",
      @"iPhone2,1":    @"iPhone 3GS",
      @"iPhone3,1":    @"iPhone 4",
      @"iPhone3,2":    @"iPhone 4(Rev A)",
      @"iPhone3,3":    @"iPhone 4(CDMA)",
      @"iPhone4,1":    @"iPhone 4S",
      @"iPhone5,1":    @"iPhone 5(GSM)",
      @"iPhone5,2":    @"iPhone 5(GSM+CDMA)",
      @"iPhone5,3":    @"iPhone 5c(GSM)",
      @"iPhone5,4":    @"iPhone 5c(GSM+CDMA)",
      @"iPhone6,1":    @"iPhone 5s(GSM)",
      @"iPhone6,2":    @"iPhone 5s(GSM+CDMA)",
      
      @"iPhone7,1":    @"iPhone 6+(GSM+CDMA)",
      @"iPhone7,2":    @"iPhone 6(GSM+CDMA)",
      
      @"iPhone8,1":    @"iPhone 6S(GSM+CDMA)",
      @"iPhone8,2":    @"iPhone 6S+(GSM+CDMA)",
      @"iPhone8,4":    @"iPhone SE(GSM+CDMA)",
      @"iPhone9,1":    @"iPhone 7(GSM+CDMA)",
      @"iPhone9,2":    @"iPhone 7+(GSM+CDMA)",
      @"iPhone9,3":    @"iPhone 7(GSM+CDMA)",
      @"iPhone9,4":    @"iPhone 7+(GSM+CDMA)",
      
      @"iPad1,1":  @"iPad",
      @"iPad2,1":  @"iPad 2(WiFi)",
      @"iPad2,2":  @"iPad 2(GSM)",
      @"iPad2,3":  @"iPad 2(CDMA)",
      @"iPad2,4":  @"iPad 2(WiFi Rev A)",
      @"iPad2,5":  @"iPad Mini 1G (WiFi)",
      @"iPad2,6":  @"iPad Mini 1G (GSM)",
      @"iPad2,7":  @"iPad Mini 1G (GSM+CDMA)",
      @"iPad3,1":  @"iPad 3(WiFi)",
      @"iPad3,2":  @"iPad 3(GSM+CDMA)",
      @"iPad3,3":  @"iPad 3(GSM)",
      @"iPad3,4":  @"iPad 4(WiFi)",
      @"iPad3,5":  @"iPad 4(GSM)",
      @"iPad3,6":  @"iPad 4(GSM+CDMA)",
      
      @"iPad4,1":  @"iPad Air(WiFi)",
      @"iPad4,2":  @"iPad Air(GSM)",
      @"iPad4,3":  @"iPad Air(GSM+CDMA)",
      
      @"iPad5,3":  @"iPad Air 2 (WiFi)",
      @"iPad5,4":  @"iPad Air 2 (GSM+CDMA)",
      
      @"iPad4,4":  @"iPad Mini 2G (WiFi)",
      @"iPad4,5":  @"iPad Mini 2G (GSM)",
      @"iPad4,6":  @"iPad Mini 2G (GSM+CDMA)",
      
      @"iPad4,7":  @"iPad Mini 3G (WiFi)",
      @"iPad4,8":  @"iPad Mini 3G (GSM)",
      @"iPad4,9":  @"iPad Mini 3G (GSM+CDMA)",
      
      @"iPod1,1":  @"iPod 1st Gen",
      @"iPod2,1":  @"iPod 2nd Gen",
      @"iPod3,1":  @"iPod 3rd Gen",
      @"iPod4,1":  @"iPod 4th Gen",
      @"iPod5,1":  @"iPod 5th Gen",
      @"iPod7,1":  @"iPod 6th Gen",
      };
    
    NSString *deviceName = commonNamesDictionary[machineName];
    
    if (deviceName == nil) {
        deviceName = machineName;
    }
    
    return deviceName;
}

/*
 * Following method identifies and categorizes the devices with the same screen size of iPhone5.
 * 1136 x 640 (727,040 total) resolution at 326 ppi, and 4 (3.48 × 1.96) inches.
 * Ex:- iPhone5, iPhone5S, iPhone5C, iPhone SE
 */
+ (BOOL)isIPhone5SizedDevice {
    if (DEVICE_TYPE_NUMBER == 1) {
        return YES;
    }
    if ([[DeviceTypes deviceModelName] isEqualToString:@"iPhone 5(GSM)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 5(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 5c(GSM)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 5c(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 5s(GSM)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 5s(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone SE(GSM+CDMA)"]) {
        return YES;
    } else if ([[DeviceTypes deviceModelName] isEqualToString:@"iPhone5,1"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone5,2"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone5,3"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone5,4"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone6,1"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone6,2"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone8,4"]) {
        return YES;
    } else {
        return NO;
    }
}

/*
 * Following method identifies the device based on the devices categorized under the same size of iPhone6.
 * 1334 x 750 (1,000,500 total) at 326 ppi, and 4.7 (4.1 × 2.3) inches
 * Ex:- iPhone6, iPhone6S
 */
+ (BOOL)isIPhone6SizedDevice {
    if (DEVICE_TYPE_NUMBER == 2) {
        return YES;
    }
    if ([[DeviceTypes deviceModelName] isEqualToString:@"iPhone 6(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 6S(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 7(GSM+CDMA)"]) {
        return YES;
    } else if ([[DeviceTypes deviceModelName] isEqualToString:@"iPhone7,2"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone8,1"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone9,1"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone9,3"]) {
        return YES;
    } else {
        return NO;
    }
}

/*
 * Following method identifies the device based on the devices categorized under the same size of iPhone6+.
 * 1920 x 1080 (2,073,600 total) resolution at 401 ppi, 5.5 (4.79 × 2.7) inches.
 * Ex:- iPhone6+, iPhone6S+
 */
+ (BOOL)isIPhone6PlusSizedDevice {
    if (DEVICE_TYPE_NUMBER == 3) {
        return YES;
    }
    if ([[DeviceTypes deviceModelName] isEqualToString:@"iPhone 6+(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 6S+(GSM+CDMA)"] ||
        [[DeviceTypes deviceModelName] isEqualToString:@"iPhone 7+(GSM+CDMA)"]) {
        return YES;
    } else if ([[DeviceTypes deviceModelName] isEqualToString:@"iPhone7,1"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone8,2"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone9,2"] ||
               [[DeviceTypes deviceModelName] isEqualToString:@"iPhone9,4"]) {
        return YES;
    } else {
        return NO;
    }
}

/*
 * Following method distinguishes if the device is an iPad type or not.
 */
+ (BOOL)isIPad {
    if (DEVICE_TYPE_NUMBER == 4) {
        return YES;
    }
    NSArray *arrMachineNames = @[@"iPad1,1", @"iPad2,1", @"iPad2,2", @"iPad2,3", @"iPad2,4", @"iPad2,5", @"iPad2,6", @"iPad2,7", @"iPad3,1", @"iPad3,2", @"iPad3,3", @"iPad3,4", @"iPad3,5", @"iPad3,6", @"iPad4,1", @"iPad4,2", @"iPad4,3", @"iPad5,3", @"iPad5,4", @"iPad4,4", @"iPad4,5", @"iPad4,6", @"iPad4,7", @"iPad4,8", @"iPad4,9"];
    
    NSArray *arrDeviceNames = @[@"iPad", @"iPad 2(WiFi)", @"iPad 2(GSM)", @"iPad 2(CDMA)", @"iPad 2(WiFi Rev A)", @"iPad Mini 1G (WiFi)", @"iPad Mini 1G (GSM)", @"iPad Mini 1G (GSM+CDMA)", @"iPad 3(WiFi)", @"iPad 3(GSM+CDMA)", @"iPad 3(GSM)", @"iPad 4(WiFi)", @"iPad 4(GSM)", @"iPad 4(GSM+CDMA)", @"iPad Air(WiFi)", @"iPad Air(GSM)", @"iPad Air(GSM+CDMA)", @"iPad Air 2 (WiFi)", @"iPad Air 2 (GSM+CDMA)", @"iPad Mini 2G (WiFi)", @"iPad Mini 2G (GSM)", @"iPad Mini 2G (GSM+CDMA)", @"iPad Mini 3G (WiFi)", @"iPad Mini 3G (GSM)", @"iPad Mini 3G (GSM+CDMA)"];
    
    BOOL result = NO;
    if ([arrDeviceNames containsObject:[DeviceTypes deviceModelName]]) {
        result = YES;
    } else if ([arrMachineNames containsObject:[DeviceTypes deviceModelName]]) {
        result = YES;
    }
    
    return result;
}

/*
 * Simply does the same thing which
 * [[UIDevice currentDevice] model] does.
 */
+ (NSString *)getDeviceType {
    NSString *deviceName = [DeviceTypes deviceModelName];
    if ([deviceName containsString:@"iPhone"]) {
        return @"iPhone";
    } else if ([deviceName containsString:@"iPod"]) {
        return @"iPod";
    } else if ([deviceName containsString:@"iPad"]) {
        return @"iPad";
    } else {
        return [[UIDevice currentDevice] model];
    }
    
    return @"UNKNOWN";
}

+ (CGFloat)getDeviceWidth {
    return CGRectGetWidth([[UIScreen mainScreen] bounds]);
}

+ (CGFloat)getDeviceHeight {
    return CGRectGetHeight([[UIScreen mainScreen] bounds]);
}

@end
