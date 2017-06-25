# VerloopSDK

[![CI Status](http://img.shields.io/travis/prashantnayakhike/VerloopSDK.svg?style=flat)](https://travis-ci.org/prashantnayakhike/VerloopSDK)
[![Version](https://img.shields.io/cocoapods/v/VerloopSDK.svg?style=flat)](http://cocoapods.org/pods/VerloopSDK)
[![License](https://img.shields.io/cocoapods/l/VerloopSDK.svg?style=flat)](http://cocoapods.org/pods/VerloopSDK)
[![Platform](https://img.shields.io/cocoapods/p/VerloopSDK.svg?style=flat)](http://cocoapods.org/pods/VerloopSDK)

## Installation

VerloopSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
    pod "VerloopSDK"
```
Then, run the following command:

```ruby
    $pod install
```

## Usage

1. Initialise Verloop in application:didFinishLaunchingWithOptions.

```ruby
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let notificationSettings = UIUserNotificationSettings(types: [UIUserNotificationType.badge, UIUserNotificationType.sound, UIUserNotificationType.alert], categories: nil)
    application.registerUserNotificationSettings(notificationSettings)


    let config = VerloopConfig.init(subDomain: "name.stage", token: "test");
    config.name = "testName"
    config.email = "testEmail"
    config.msisdn = "testNumber"
    Verloop.sharedInstance.register(withConfig: config);
    return true
}
```

2. Update the device token in application:didRegisterForRemoteNotificationsWithDeviceToken

```ruby
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
    Verloop.sharedInstance.updateDeviceToken(withDeviceToken: deviceTokenString);
}
```

3. Handle notification 

```ruby
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    if Verloop.sharedInstance.isVerloopNotif(wihtNotif: userInfo) {
        Verloop.sharedInstance.handleNotif(withNotif: userInfo)
    }
}
```
4. Start live chat 

```ruby
    Verloop.sharedInstance.showConversation()
```


## Author

Verloop, hello@verloop.io

## License

VerloopSDK is available under the MIT license. See the LICENSE file for more info.
