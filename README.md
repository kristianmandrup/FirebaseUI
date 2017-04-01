# Firebase UI for React Native

[![Greenkeeper badge](https://badges.greenkeeper.io/kristianmandrup/FirebaseUI.svg)](https://greenkeeper.io/)

An experiment, trying to wrap [Firebase UI](https://github.com/firebase/FirebaseUI-iOS) for [React Native](https://facebook.github.io/react-native/) 

### Various resourcess

- [Custom iOS views with React Native](http://almostobsolete.net/react-native/custom-ios-views-with-react-native.html)
- [Using CocoaPods with React Native](https://shift.infinite.red/beginner-s-guide-to-using-cocoapods-with-react-native-46cb4d372995#.1xuceegqs)
- Catalogue of some nice [Cocoa controls](https://www.cocoacontrols.com/)
- Ideally we also want to enable [Touch ID auth](https://auth0.com/blog/2015/04/03/using-touchid-for-authentication-in-your-react-native-app/)
- Perhaps we can use [Form generator](https://www.npmjs.com/package/react-native-form-generator) for Registration etc?
- React Native [new-library](https://github.com/facebook/react-native/pull/405) generator, source [here](https://github.com/facebook/react-native/pull/405/commits/396439bf86df51067ea3bb539e1fee41214cf10b)

`react-native new-library --name Auth`

- There is also [React Native Cordova plugins](http://blog.nparashuram.com/2015/10/using-cordova-plugins-in-react-native.html) as inspiration...
- Also see: [Bridging in React Native](http://tadeuzagallo.com/blog/react-native-bridge/)

Check [Beginners Guide: Firebase React Native ](https://www.firebase.com/blog/2016-01-20-tutorial-firebase-react-native.html)

- [ListView with section headers](http://moduscreate.com/react-native-listview-with-section-headers/)
- [TableView](https://github.com/aksonov/react-native-tableview) - Can we hook this up with `FirebaseTableViewDataSource` :)

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
#import "RCTBridgeModule.h"

@interface TableViewDataSource : NSObject <RCTBridgeModule>
  @property (strong, nonatomic) NSString *firebaseUrl;
  @property (strong, nonatomic) NSString *reuseIdentifier;
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
    self.dataSource = [[FirebaseTableViewDataSource alloc] initWithRef:self.firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.tableView];

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

We now see that we can extract common functionality into abstract base classes!

### DataSource

We create a common class `DataSource` for all Views using a Firebase DataSource.

```objective-c
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FirebaseTableViewDataSource.h"
#import "RCTBridgeModule.h"

@interface RNDataSource : NSObject <RCTBridgeModule>
@property (strong, nonatomic, __NON_NULL) NSString *firebaseUrl;
@property (strong, nonatomic, __NON_NULL) NSString *reuseIdentifier;
@property (strong, nonatomic, __NON_NULL) Firebase *firebaseRef;
@end
```

```objective-c
#import "RNDataSource.h"
#import <Firebase/Firebase.h>

@implementation RNDataSource
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];
  self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl];
  self.reuseIdentifier = reuseIdentifier;
}
@end
```

A samle subclass, `RNTableViewDataSource` 

```objective-c
#import "RNTableViewDataSource.h"
#import <Firebase/Firebase.h>
#import "AppDelegate.h"

@implementation RNTableViewDataSource
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(init:(NSString *)appName reuseIdentifier:(NSString *)reuseIdentifier)
{
  [super init];
}

RCT_EXPORT_METHOD(setup)
{
  self.dataSource = [[RNTableViewDataSource alloc]
                     initWithRef:self.firebaseRef cellReuseIdentifier:self.reuseIdentifier view:self.tableView];

  [self.dataSource populateCellWithBlock:^(UITableViewCell *cell, FDataSnapshot *snap) {
    // Populate cell as you see fit, like as below
    cell.textLabel.text = snap.key;
  }];

  [self.tableView setDataSource:self.dataSource];
}
@end
```

### AuthProvider

```objective-c
#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>
#import "RCTBridgeModule.h"

@interface AuthProvider : NSObject <RCTBridgeModule>
@property (strong, nonatomic) NSString *firebaseUrl;
@property (strong, nonatomic) Firebase *firebaseRef;
- (NSObject)createProvider;
@end
```

The base implementation creates a connection and creates a provider, by calling `createProvider` to be provided by the subclass
`xyzAuthProvider`.

```objective-c
#import "AuthProvider.h"
#import <Firebase/Firebase.h>

@implementation AuthProvider

RCT_EXPORT_METHOD(init:(NSString *)appName)
{
  self.firebaseUrl = [NSString stringWithFormat:@"https://%@.firebaseio.com/", appName];
  self.firebaseRef = [[Firebase alloc] initWithUrl:self.firebaseUrl];
  self.provider = [self.createProvider];
}
@end

```

## Specifications

- Authentication `firebase-ui-auth`
- Data bound Views `firebase-ui-views`

We recommend using a suitable IDE/Editor for React Native development, such as:

- Visual Studio code (with React Native plugin)
- Nuclide IDE (Atom) - by Facebook
- ... ???

You are encouraged to use Swift instead of Objective C, unless you have no prior experience with Swift.
Use this project as a baseline or inspiration. Should provide a skeleton of the general idea.
Look at other React Native custom components in the wild to see how such a project is best configured.

### Authentication

We need to wrap the Firebase Auth for use with React Native 

- `FirebaseAuthProvider` Generic superclass for authentication providers
- `FirebaseFacebookAuthProvider`  Allows for one method login to Facebook
- `FirebaseGoogleAuthProvider`  Allows for one method login to Google
- `FirebaseTwitterAuthProvider` Allows for one method login to Twitter
- `FirebasePasswordAuthProvider`  Allows for one method login to Firebases email/password authentication
- `FirebaseLoginViewController` Flexible headful UI which handles login, logout, and error conditions from all identity providers

Usage from ES2015 (React Native)

```js
import {
  FireAuthProvider,
  FireFacebookAuthProvider,
  FireGoogleAuthProvider,
  FireTwitterAuthProvider,
  FirePasswordAuthProvider,

  // the main UI component
  FireLoginViewController
} from 'firebase-ui-auth';



class AuthDemoApp extends React.Component {
  render() {
    return (
      <FireLoginView ref={fireRef} providers={...providers}/>
    )
  }
}

```

Auth Providers should use a similar API as on the native side. The key is to avoid duplication and make it simple!
We can assume we have a single const Firebase ref in the app, so no need to have an API for each that requires to recreate
a new firebase ref each time (if possible). Reuse as makes sense!

Create a React Native client app which displays the LoginView via the `FireLoginViewController` and demonstrates social login using 
ALL of the supported providers. Note: Highest priority to Google and Facebook.   

### Data bound Views

Top priority is the data bound CollectionView and DataSource. TableView has 2nd priority.

```js
import {
  FireTableView,
  FireCollectionView,

  // we need these for fine grained control
  FireCollectionViewDataSource,
  FireTableViewDataSource,
  FirebaseDataSource

} from 'firebase-ui-views';


// somewhere..

const firebaseRef = new FirebaseRef(fireUrl);

// Try playground: https://rnplay.org/apps/05ivvQ

class CollectionViewDemo extends React.Component {

  // ... appropriate lifecycle method? 
  // See ListView
  constructor(props) {
    super(props);
    this.state = {
      dataSource: tableDS = new FireCollectionViewDataSource(firebaseRef, id);
    };
  }
        
  render() {
    return (
      <FireCollectionView dataSource={this.state.dataSource}
        ...
      />
    )
  }
}
```

```js
class TableViewDemo extends React.Component {
   /// ...
// 
  constructor(props) {
    super(props);
    this.state = {
      dataSource: tableDS = new FireTableViewDataSource(firebaseRef, id);
    };
  }
  
  render() {
    return (
      <FireTableView dataSource={this.state.dataSource} 
        ...
      />
    )
  }
}
