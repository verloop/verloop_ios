//
//  Verloop.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/05/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import Foundation
import UIKit

class Verloop {
    
    var config:VerloopConfig?
    var isConvScreenVisible:Bool?
    
    static let sharedInstance = Verloop()
    private init() {}
    
    func register(withConfig config:VerloopConfig) {
        self.config = config;
    }
    
    func showConversation() {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            if self.config != nil  {
                let chatUrl = self.config?.verloopChatUrl()
                print(chatUrl!)
                self.isConvScreenVisible = true;
                let vc:VerloopChatViewController = VerloopChatViewController.init(chatUrl: chatUrl!, title: (self.config?.subDomain)!, viewOutOfFocusBlock: { (Void) in
                    self.isConvScreenVisible = false;
                })
                let navVC = VerloopNavigationViewController.init(rootViewController: vc)
                topController.present(navVC, animated: true, completion: nil)
                
                
            } else {
                let alert = UIAlertController.init(title: "Error", message: "Your app is not registered", preferredStyle: UIAlertControllerStyle.alert);
                alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
                topController.present(alert, animated: true, completion: nil)
            }
        }
 
    }
    
    func isVerloopNotif(wihtNotif notif:[AnyHashable : Any]) -> Bool {
        //Some check
        let from:String = (notif["_by"] as? String)!
        let isEqual = (from == "verloop")
        return isEqual;
    }
    
    func handleNotif(withNotif notif:[AnyHashable : Any]) {
        if UIApplication.shared.applicationState.rawValue != UIApplicationState.active.rawValue {
            if !self.isConvScreenVisible! {
                self.showConversation();
            }
        }
    }
    
    func updateDeviceToken(withDeviceToken deviceToke:String?) {
        self.config?.updateDeviceToken(deviceToken: deviceToke)
    }
}
