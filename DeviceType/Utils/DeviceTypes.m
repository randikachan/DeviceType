//
//  DeviceTypes.m
//  DeviceType
//
//  Created by Kasun Randika on 6/28/16.
//  Copyright © 2016 Kasun Randika. All rights reserved.
//

#import "DeviceTypes.h"
#import <sys/utsname.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@implementation DeviceTypes

+ (NSString*)deviceModelName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machineName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //MARK: More official list is at
    //http://theiphonewiki.com/wiki/Models
    //MARK: You may just return machineName. Following is for convenience
    
    NSDictionary *commonNamesDictionary =
    @{
      @"i386":     @"iPhone Simulator",
      @"x86_64":   @"iPad Simulator",
      
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
      
      @"iPhone7,1":    @"iPhone 6+ (GSM+CDMA)",
      @"iPhone7,2":    @"iPhone 6 (GSM+CDMA)",
      
      @"iPhone8,1":    @"iPhone 6S (GSM+CDMA)",
      @"iPhone8,2":    @"iPhone 6S+ (GSM+CDMA)",
      
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

+ (BOOL)isIPhone5 {
    if (DEVICE_TYPE_NUMBER == 1) {
        return YES;
    }
    if ([[Config deviceModelName] isEqualToString:@"iPhone 5(GSM)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 5(GSM+CDMA)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 5c(GSM)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 5c(GSM+CDMA)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 5s(GSM)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 5s(GSM+CDMA)"]) {
        return YES;
    } else if ([[Config deviceModelName] isEqualToString:@"iPhone5,1"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone5,2"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone5,3"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone5,4"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone6,1"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone6,2"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isIPhone6 {
    if (DEVICE_TYPE_NUMBER == 2) {
        return YES;
    }
    if ([[Config deviceModelName] isEqualToString:@"iPhone 6 (GSM+CDMA)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 6S (GSM+CDMA)"]) {
        return YES;
    } else if ([[Config deviceModelName] isEqualToString:@"iPhone7,2"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone8,1"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isIPhone6Plus {
    if (DEVICE_TYPE_NUMBER == 3) {
        return YES;
    }
    if ([[Config deviceModelName] isEqualToString:@"iPhone 6+ (GSM+CDMA)"] ||
        [[Config deviceModelName] isEqualToString:@"iPhone 6S+ (GSM+CDMA)"]) {
        return YES;
    } else if ([[Config deviceModelName] isEqualToString:@"iPhone7,1"] ||
               [[Config deviceModelName] isEqualToString:@"iPhone8,2"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isIPad {
    if (DEVICE_TYPE_NUMBER == 4) {
        return YES;
    }
    NSArray *arrMachineNames = @[@"iPad1,1", @"iPad2,1", @"iPad2,2", @"iPad2,3", @"iPad2,4", @"iPad2,5", @"iPad2,6", @"iPad2,7", @"iPad3,1", @"iPad3,2", @"iPad3,3", @"iPad3,4", @"iPad3,5", @"iPad3,6", @"iPad4,1", @"iPad4,2", @"iPad4,3", @"iPad5,3", @"iPad5,4", @"iPad4,4", @"iPad4,5", @"iPad4,6", @"iPad4,7", @"iPad4,8", @"iPad4,9"];
    
    NSArray *arrDeviceNames = @[@"iPad", @"iPad 2(WiFi)", @"iPad 2(GSM)", @"iPad 2(CDMA)", @"iPad 2(WiFi Rev A)", @"iPad Mini 1G (WiFi)", @"iPad Mini 1G (GSM)", @"iPad Mini 1G (GSM+CDMA)", @"iPad 3(WiFi)", @"iPad 3(GSM+CDMA)", @"iPad 3(GSM)", @"iPad 4(WiFi)", @"iPad 4(GSM)", @"iPad 4(GSM+CDMA)", @"iPad Air(WiFi)", @"iPad Air(GSM)", @"iPad Air(GSM+CDMA)", @"iPad Air 2 (WiFi)", @"iPad Air 2 (GSM+CDMA)", @"iPad Mini 2G (WiFi)", @"iPad Mini 2G (GSM)", @"iPad Mini 2G (GSM+CDMA)", @"iPad Mini 3G (WiFi)", @"iPad Mini 3G (GSM)", @"iPad Mini 3G (GSM+CDMA)"];
    
    BOOL result = NO;
    if ([arrDeviceNames containsObject:[Config deviceModelName]]) {
        result = YES;
    } else if ([arrMachineNames containsObject:[Config deviceModelName]]) {
        result = YES;
    }
    
    return result;
}

@end
