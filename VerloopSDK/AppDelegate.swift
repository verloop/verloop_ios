//
//  AppDelegate.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/05/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let notificationSettings = UIUserNotificationSettings(types: [UIUserNotificationType.badge, UIUserNotificationType.sound, UIUserNotificationType.alert], categories: nil)
        application.registerUserNotificationSettings(notificationSettings)
        
        
        let config = VerloopConfig.init(subDomain: "manish.stage", token: "a11f88501ed695bf280ff02a3f02964461d84fcc6cf931917bd17fde578b1544");
        config.name = "test123"
        config.email = "pkn.prashant@gmail.com"
        config.msisdn = "9845062655"
        Verloop.sharedInstance.register(withConfig: config);
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
            application.registerForRemoteNotifications()
    }
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        Verloop.sharedInstance.updateDeviceToken(withDeviceToken: deviceTokenString);
    }
    
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("register failed")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        if Verloop.sharedInstance.isVerloopNotif(wihtNotif: userInfo) {
            Verloop.sharedInstance.handleNotif(withNotif: userInfo)
        }
    }



}

