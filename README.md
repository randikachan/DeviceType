# DeviceType
iOS Objective-C minimal class files with some methods, which will be helpful to identify what's the type of the device is, the app is running on.

This is a collection of utility methods which let's identify the device hardware and software related properties.

<p align="center">
<img src="http://i.imgur.com/KAyOm01.png?1" width="730" height="667" alt="Real Device iPhone6S Vs iPhone6S Simulator"/><br/>
<span> Screenshots of the demo app to show the methods </span>
</p>
</p>

### How to use this utility class?

<p>
Find the `DeviceTypes` directory within the project folder, and within that there are the `DeviceTypes(.h/.m)` class
files. So drag and drop that directory into your Project in XCode.

###### Import the class file <br/>
```
// within your implementation file (.m) import it as follows
#import "DeviceTypes.h"
```
###### Use it as follows<br/>
```
if ([DeviceTypes isIPhone5SizedDevice]) {
    // Do your required logic relevant to iPhoneSE Size screens or devices (iPhone5, 5S, SE)
} else if ([DeviceTypes isIPhone6SizedDevice]) {
    // Do your required logic relevant to iPhone7 Size screens or devices (iPhone6, 6S, 7)
} else if ([DeviceTypes isIPhone6PlusSizedDevice]) {
    // Do your required logic relevant to iPhone7+ Size screens or devices (iPhone6+, 6S+, 7+)
} else if ([DeviceTypes isIPad]) {
    // Do your required logic relevant to iPads
}
```

And this utility class also provides the following useful set of methods too.
```
+ (NSString*)deviceModelName
    Retrieves back the device name or if not the machine name.
+ (NSString *)getDeviceType
    Simply does the same thing which [[UIDevice currentDevice] model] does.
+ (CGFloat)getDeviceWidth
+ (CGFloat)getDeviceHeight
```
