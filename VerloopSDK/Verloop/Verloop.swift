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
    
    static let sharedInstance = Verloop()
    private init() {}
    
    func register(withConfig config:VerloopConfig) {
        self.config = config;
    }
    
    func showConversation(parentViewController:UIViewController) {
        if self.config != nil {
            let chatUrl = self.config?.verloopChatUrl()
            print(chatUrl!)
            let vc = VerloopChatViewController.init(chatUrl: chatUrl!, title: (self.config?.subDomain)!);
            let navVC = UINavigationController.init(rootViewController: vc)
            parentViewController.present(navVC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController.init(title: "Error", message: "Your app is not registered", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            parentViewController.present(alert, animated: true, completion: nil)
        }
    }
    
        
    
    
    
}
