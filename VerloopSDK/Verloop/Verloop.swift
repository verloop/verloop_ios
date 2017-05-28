//
//  Verloop.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/05/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import Foundation
import UIKit
import OneSignal

class Verloop {
    
    var config:VerloopConfig?
    
    static let sharedInstance = Verloop()
    private init() {}
    
    
    @objc func applicationEnteredBackground() {
        self.toggleNotification(shouldShow: true)
    }
    
    func register(withConfig config:VerloopConfig) {
        self.config = config;
        self.initialiseOneSignal(config: config)
        self.toggleNotification(shouldShow: true)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationEnteredBackground), name:.UIApplicationDidEnterBackground, object: nil)
    }
    
    func initialiseOneSignal(config:VerloopConfig) {
        
        let notificationReceivedBlock: OSHandleNotificationReceivedBlock = { notification in
            
            print("Received Notification: \(notification!.payload.notificationID)")
        }
        
        let notificationOpenedBlock: OSHandleNotificationActionBlock = { result in
            // This block gets called when the user reacts to a notification received
            self.showConversation()
        }
        
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false,
                                     kOSSettingsKeyInAppLaunchURL: true]
        OneSignal.initWithLaunchOptions(config.launchOption, appId: config.notificationId, handleNotificationReceived: notificationReceivedBlock, handleNotificationAction: notificationOpenedBlock, settings: onesignalInitSettings)
        OneSignal.promptForPushNotifications { (granted:Bool) in
            print(granted ? "Granted" : "Not granted")
        }
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification
       
    }
    
    func showConversation() {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            if self.config != nil  {
                self.config?.deviceToken = OneSignal.getPermissionSubscriptionState().subscriptionStatus.userId;
                let chatUrl = self.config?.verloopChatUrl()
                print(chatUrl!)
                self.toggleNotification(shouldShow: false)
                let vc:VerloopChatViewController = VerloopChatViewController.init(chatUrl: chatUrl!, title: (self.config?.subDomain)!, viewOutOfFocusBlock: { (Void) in
                    self.toggleNotification(shouldShow: true)
                })
                let navVC = UINavigationController.init(rootViewController: vc)
                topController.present(navVC, animated: true, completion: nil)
                
                
            } else {
                let alert = UIAlertController.init(title: "Error", message: "Your app is not registered", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                topController.present(alert, animated: true, completion: nil)
            }
        }
 
        }
        
    func toggleNotification(shouldShow:Bool) -> Void {
        OneSignal.inFocusDisplayType = shouldShow ? OSNotificationDisplayType.notification : OSNotificationDisplayType.none

    }
    
   
    
}
