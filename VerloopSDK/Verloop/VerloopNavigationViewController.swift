//
//  VerloopNavigationViewController.swift
//  VerloopSDK
//
//  Created by Prashanta Kumar Nayak on 24/06/17.
//  Copyright © 2017 Verloop. All rights reserved.
//

import UIKit

class VerloopNavigationViewController: UINavigationController {

    override func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        if let vc = self.presentedViewController {
            // don't bother dismissing if the view controller being presented is a doc/image picker
            if !vc.isKind(of: UIDocumentMenuViewController.self) ||
                !vc.isKind(of: UIImagePickerController.self) {
                super.dismiss(animated: flag, completion: completion)
            }
        }
    }
}
