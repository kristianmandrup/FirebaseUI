# Firebase UI for React Native

An experiment, trying to wrap [Firebase UI]() for [React Native]() 

[Custom iOS views with React Native](http://almostobsolete.net/react-native/custom-ios-views-with-react-native.html)
[Using CocoaPods with React Native](https://shift.infinite.red/beginner-s-guide-to-using-cocoapods-with-react-native-46cb4d372995#.1xuceegqs)
Catalogue of some nice [Cocoa controls](https://www.cocoacontrols.com/)
Ideally we also want to enable [Touch ID auth](https://auth0.com/blog/2015/04/03/using-touchid-for-authentication-in-your-react-native-app/)
Perhaps we can use [Form generator](https://www.npmjs.com/package/react-native-form-generator) for Registration etc?

React Native [new-library](https://github.com/facebook/react-native/pull/405) generator, source [here](https://github.com/facebook/react-native/pull/405/commits/396439bf86df51067ea3bb539e1fee41214cf10b)

`react-native new-library --name Auth`

There is also [React Native Cordova plugins](http://blog.nparashuram.com/2015/10/using-cordova-plugins-in-react-native.html) as inspiration...

Also see: [Bridging in React Native](http://tadeuzagallo.com/blog/react-native-bridge/)

### Adding pods

We add a `Podfile` using `pod init` in `/ios` folder.

```ruby
# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

# Uncomment this line if you’re using Swift
# use_frameworks!

target "RNFirebaseUI" do
  pod 'FirebaseUI', '~> 0.2.0'
end
```

Alternatively select specific auth providers

```ruby
# Only pull in the "Core" FirebaseUI features
pod 'FirebaseUI/Core', '~> 0.3'

# Pull in the "Auth" FirebaseUI features: Facebook, Google, Twitter, and Email/Password auth
pod 'FirebaseUI/Auth', '~> 0.3'

# Selectively pull in Auth providers
pod 'FirebaseUI/Facebook', '~> 0.3.2'
pod 'FirebaseUI/Google', '~> 0.3.2'
pod 'FirebaseUI/Twitter', '~> 0.3.2'
pod 'FirebaseUI/Password', '~> 0.3.2' 
```

The target name `RNFirebaseUI` must match the XCode project name.

Run `pod install` to install `FirebaseUI` as a pod (in `/Pods` folder).

Open the `RNFirebaseUI.xcode` project in Xcode and add (drag) the `libPods-FirebaseUI.a` file from the `/Frameworks` folder 
to *Linked Frameworks and Libraries*.


Create a new Cocoa class `SocialAuth`. Open `SocialAuth.h` and change it as follows:

```objective-c
#import "RCTBridge.h"
@interface SocialAuth : NSObject <RCTBridgeModule>
@end
```

Also change `SocialAuth.m` to look like this:

```objective-c
#import "SocialAuth.h"
#import "RCTLog.h"
@implementation SocialAuth
RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(log)
{
  // Here's our method's code
  RCTLogInfo(@"SocialAuth called!");
}
@end
```

Now we can test `SocialAuth` from Javascript as follows:

```js
var SocialAuth = require('NativeModules').SocialAuth;
SocialAuth.log();
```

We define some properties in the interface file.

```objective-c
#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>
#import "FirebaseTableViewDataSource.h"

@interface TableViewDataSource : NSObject
  @property (strong, nonatomic) String *firebaseUrl;
  @property (strong, nonatomic) String *reuseIdentifier;
  @property (strong, nonatomic) Firebase *firebaseRef;
  @property (strong, nonatomic) FirebaseTableViewDataSource *dataSource;
@end
```

```objective-c
#import "TableViewDataSource.h"
#import <Firebase/Firebase.h>
#import "FirebaseTableViewDataSource.h"
#import "AppDelegate.h"

@implementation TableViewDataSource
  RCT_EXPORT_MODULE();
  RCT_EXPORT_METHOD(init:(NSString *)appName, (NSString *)reuseIdentifier)
  {
    // make into properties
    self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];    
    self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl;    
    self.reuseIdentifier = reuseIdentifier;
    self.dataSource = [[FirebaseTableViewDataSource alloc] initWithRef:firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.tableView];

    [self.dataSource populateCellWithBlock:^(UITableViewCell *cell, FDataSnapshot *snap) {
      // Populate cell as you see fit, like as below
      cell.textLabel.text = snap.key;
    }];

    [self.tableView setDataSource:self.dataSource];
  }
@end
```

We do the same for:
- CollectionViewDataSource
- LoginViewController
- FacebookAuthProvider
- ...

Just do it!