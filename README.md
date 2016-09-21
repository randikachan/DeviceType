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

###### Import the class file as follows<br/>
```sh
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
```sh
+ (NSString*)deviceModelName
    Retrieves back the device name or if not the machine name.
+ (NSString *)getDeviceType
    Simply does the same thing which [[UIDevice currentDevice] model] does.
+ (CGFloat)getDeviceWidth
+ (CGFloat)getDeviceHeight
```

#### Note:
    - If you found anything wrong which I have done or may be a bug please help me to improve this codebase.
    - You can always add up your valuable utility methods to this class which is related to device types.
    - Don't forget to check out the DeviceType projects "ViewController.h/.m" file simple implementation to get some more ideas.


##License
This source code is made available under the MIT License.

```sh
Copyright (c) 2016 Kasun Randika

Permission is hereby granted, free of charge, to any person obtaining a copy 
of this software and associated documentation files (the "Software"), to deal 
in the Software without restriction, including without limitation the rights 
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
copies of the Software, and to permit persons to whom the Software is 
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
IN THE SOFTWARE.
```
