//
//  DeviceTypes.h
//  DeviceType
//
//  Created by Kasun Randika on 6/28/16.
//  Copyright © 2016 Kasun Randika. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// For the releases or real device testing following constant must be set to Zero
#define DEVICE_TYPE_NUMBER 0        // 0 -> Real Device | 1 -> iPhone5/5S/SE | 2 -> iPhone6/6S/7 | 3 -> iPhone6+/6S+/7+ | 4 -> iPads

@interface DeviceTypes : NSObject

+ (NSString *)deviceModelName;
+ (BOOL)isIPhone5SizedDevice;
+ (BOOL)isIPhone6SizedDevice;
+ (BOOL)isIPhone6PlusSizedDevice;
+ (BOOL)isIPad;
+ (NSString *)getDeviceType;
+ (CGFloat)getDeviceWidth;
+ (CGFloat)getDeviceHeight;

@end
