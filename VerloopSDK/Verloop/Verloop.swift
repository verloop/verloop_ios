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
    static let sharedInstance = Verloop()
    private init() {}
    
    func showConversation(parentViewController:UIViewController) {
        let vc = VerloopChatViewController.init(chatUrl: "https://www.google.co.in");
        parentViewController.present(vc, animated: true, completion: nil)
    }
}
